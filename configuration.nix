{ config, lib, pkgs, ... }:

{
	imports = 
	[ # Include the results of the hardware scan
		./hardware-configuration.nix
	];

	# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Networking
	networking.hostName = "laptop_arstneio";
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/Rome";

	# Select internationalization properties
	i18n.defaultLocale = "en_US.UTF-8";
	console = {
		font = "Lat2-Terminus16";
	#        keyMap = "us";
		useXkbConfig = true; # use xkb.options in tty
	};

	# Enable flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Enable the X11 windowing system
	#services.xserver.enable = true;

	# Enable sound
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

	# Enable display manager
	services.displayManager.sddm.wayland.enable = true; # comment if you use X11 instead	
	services.displayManager.sddm.enable = true;

	# Enable XFCE4 desktop environment
	#services.xserver.desktopManager.xfce.enable = true;
	#services.displayManager.defaultSession = "xfce";	

	# Enable Hyprland tiling window manager
	programs.hyprland.enable = true;

	# Define a user account
	users.users.arstneio = {
		isNormalUser = true;
		home = "/home/arstneio";
		extraGroups = [ "wheel" ];
		password = "bob";
		packages = with pkgs; [
			tree
			brave
		];
	};

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		git
		curl
		kitty
		vim
		neofetch
	];
	
	# System state
	system.stateVersion = "24.11";
}
	
