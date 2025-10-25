{ ... }: {
  services.mako = {
    enable = true;

    anchor = "top-center";
    default-timeout = 5000;
    settings = {
      margin = 20;
      padding = 10;
      border-size = 4;
      border-radius = 2;

      font = "Cantarell 10";
      background-color = "#83a597";
      border-color = "#448488";
      text-color = "#272727";
    };
  };
}