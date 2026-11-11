{ self, inputs, ... }: {
  flake.homeModules.mcpServers = { pkgs, ... }: {
    programs.mcp = {
      enable = true;
      servers = {
        mariadb-local = {
          command = "${pkgs.writeShellScript "run-mariadb-mcp" ''
            export PATH="${pkgs.lib.makeBinPath [ pkgs.mariadb-connector-c.dev pkgs.gcc pkgs.pkg-config ]}:$PATH"
            export MARIADB_CONFIG="${pkgs.mariadb-connector-c.dev}/bin/mariadb_config"
            exec ${pkgs.uv}/bin/uvx --with 'mcp<2' --from mariadb-mcp-server python -m mariadb_mcp_server.server
          ''}";
          args = [];
          env = {
            # Note: mariadb_mcp_server reads MARIADB_* env vars
            MARIADB_HOST = "127.0.0.1";
            MARIADB_PORT = "3306";
            MARIADB_USER = "root";
            MARIADB_PASSWORD = "";
            MARIADB_DATABASE = "identity";
            DB_HOST = "127.0.0.1";
            DB_PORT = "3306";
            DB_USER = "root";
            DB_PASSWORD = "";
            DB_NAME = "identity";
            MCP_READ_ONLY = "true";
          };
        };

        # github-mcp-server = {
        #   command = "docker";
        #   args = [
        #     "run"
        #     "-i"
        #     "--rm"
        #     "-e"
        #     "GITHUB_PERSONAL_ACCESS_TOKEN"
        #     "ghcr.io/github/github-mcp-server"
        #   ];
        # };

        chrome-devtools-mcp = {
          command = "${pkgs.nodejs_26}/bin/npx";
          args = [
            "-y"
            "chrome-devtools-mcp@latest"
            "--executablePath=/etc/profiles/per-user/gambled/bin/google-chrome"
          ];
          env = {
            PUPPETEER_EXECUTABLE_PATH = "/etc/profiles/per-user/gambled/bin/google-chrome";
            CHROME_PATH = "/etc/profiles/per-user/gambled/bin/google-chrome";
            CHROME_BIN = "/etc/profiles/per-user/gambled/bin/google-chrome";
          };
        };

        devenv =
          let
            devenv-mcp-wrapper = pkgs.writers.writePython3Bin "devenv-mcp-wrapper" { flakeIgnore = [ "E501" ]; } ''
              import json
              import signal
              import subprocess
              import sys
              import threading


              def main():
                  args = sys.argv[1:]
                  cmd = ["devenv"] + (args if args else ["mcp"])

                  proc = subprocess.Popen(
                      cmd,
                      stdin=subprocess.PIPE,
                      stdout=subprocess.PIPE,
                      stderr=sys.stderr,
                      bufsize=0,
                  )

                  def sig_handler(signum, frame):
                      proc.send_signal(signum)

                  signal.signal(signal.SIGINT, sig_handler)
                  signal.signal(signal.SIGTERM, sig_handler)

                  def forward_stdout():
                      try:
                          while True:
                              line = proc.stdout.readline()
                              if not line:
                                  break
                              sys.stdout.buffer.write(line)
                              sys.stdout.buffer.flush()
                      except Exception:
                          pass

                  t_stdout = threading.Thread(target=forward_stdout, daemon=True)
                  t_stdout.start()

                  try:
                      while True:
                          line = sys.stdin.buffer.readline()
                          if not line:
                              break

                          # Intercept the server/discover probe from Antigravity
                          if b"server/discover" in line:
                              try:
                                  msg = json.loads(line.decode("utf-8"))
                                  if msg.get("method") == "server/discover":
                                      req_id = msg.get("id", 1)
                                      err_resp = {
                                          "jsonrpc": "2.0",
                                          "id": req_id,
                                          "error": {
                                              "code": -32601,
                                              "message": "Method not found",
                                          },
                                      }
                                      err_bytes = (
                                          json.dumps(err_resp) + "\n"
                                      ).encode("utf-8")
                                      sys.stdout.buffer.write(err_bytes)
                                      sys.stdout.buffer.flush()
                                      continue
                              except Exception:
                                  pass

                          if proc.poll() is not None:
                              break

                          proc.stdin.write(line)
                          proc.stdin.flush()
                  except (BrokenPipeError, KeyboardInterrupt):
                      pass
                  finally:
                      try:
                          proc.stdin.close()
                      except Exception:
                          pass
                      ret = proc.wait()
                      sys.exit(ret)


              if __name__ == "__main__":
                  main()
            '';
          in
          {
            command = "${devenv-mcp-wrapper}/bin/devenv-mcp-wrapper";
            args = [
              "--from"
              "path:\${workspaceFolder}"
              "mcp"
            ];
          };
      };
    };

    home.packages = with pkgs; [ 
      mcp-nixos 
      mcp-server-fetch
      mcp-server-git
      github-mcp-server
    ];
  };
}