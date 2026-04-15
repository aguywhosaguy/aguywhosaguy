{ pkgs, config, inputs, ...}:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "aguywhosaguy";
	email = "caseypeg8@gmail.com";
      };
    };
  };
}
