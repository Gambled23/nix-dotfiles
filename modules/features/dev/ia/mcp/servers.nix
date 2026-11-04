{ self, inputs, ... }: {
  flake.homeModules.mcpServers = { pkgs, ... }: {
    programs.mcp = {
      enable = true;
      servers = {
        github-mcp-server = {
          command = "docker";
          args = [
            "run"
            "-i"
            "--rm"
            "-e"
            "GITHUB_PERSONAL_ACCESS_TOKEN"
            "ghcr.io/github/github-mcp-server"
          ];
        };

        chrome-devtools-mcp = {
          command = "npx";
          args = [
            "-y"
            "chrome-devtools-mcp@latest"
            "--executablePath=/etc/profiles/per-user/gambled/bin/google-chrome"
          ];
          env = {
            "PUPPETEER_EXECUTABLE_PATH" = "/etc/profiles/per-user/gambled/bin/google-chrome";
            "CHROME_PATH" = "/etc/profiles/per-user/gambled/bin/google-chrome";
            "CHROME_BIN" = "/etc/profiles/per-user/gambled/bin/google-chrome";
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
                      bufsize=0
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
                                              "message": "Method not found"
                                          }
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
  };
}