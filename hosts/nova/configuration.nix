{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./docker.nix
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };

  networking = {
    hostName = "nova";
    firewall.enable = true;
    firewall.allowedTCPPorts = [22 443 80];
  };

  time.timeZone = "America/New_York";

  users.users.vaskel = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker"];
    openssh.authorizedKeys.keyFiles = [../../keys.pub];
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
  ];

  virtualisation.docker.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  system.stateVersion = "23.05";
}
