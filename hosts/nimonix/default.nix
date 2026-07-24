{ config, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/system.nix
      inputs.silentSDDM.nixosModules.default
    ];

  users.users.henryw = {
    isNormalUser = true;
    description = "Henry";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "kvm" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  networking.firewall.allowedTCPPorts = [ 5173 ];

  networking.firewall.allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];

  networking.firewall.allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nimonix";

  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
    
    amdgpu.opencl.enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput = {
    enable = true;
    touchpad = {
      disableWhileTyping = false;
    };
    mouse = {
      disableWhileTyping = false;
    };
  };

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          leftmeta = "overload(meta, f13)";
        };
      };
    };
};

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.seatd.enable = true;

  services.upower.enable = true;

  services.logind.powerKey = "ignore";

  services.flatpak.enable = true; 
 
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.niri.enable = true;

  programs.gpu-screen-recorder.enable = true;

  programs.silentSDDM = {
    enable = true;
    theme = "default";
  };

  programs.zsh = {
    enable = true;
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";

    QT_QPA_PLATFORM = "wayland";

    GDK_BACKEND = "wayland, x11";

    NIXOS_OZONE_WL = "1";
  };

  environment.shells = with pkgs; [ zsh ];

  fonts.packages = with pkgs; [
    open-sans
    nerd-fonts.noto
  ];

  nix.settings = {
    # This appends to the default cache instead of wiping it out
    extra-substituters = [ "https://niri.cachix.org" ];
    extra-trusted-public-keys = [ "niri.cachix.org-1:Wv0Om60eV7UR0NTgVVe6S27866vCoZ5NInFf96gAtAM=" ];
  };
}
