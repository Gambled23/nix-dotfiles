# Home manager file
{ ... }: {
  services.hyprsunset = {
    enable = true;
    settings = {
      max-gamma = 150;

      profile = [
        {
          time = "8:00";
          identity = true;
        }
        {
          time = "19:00";
          temperature = 6000;
          gamma = 1;
        }
        {
          time = "21:00";
          temperature = 5000;
          gamma = 0.8;
        }
      ];
    };
  };
}