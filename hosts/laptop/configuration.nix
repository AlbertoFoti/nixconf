{ config, lib, pkgs, ... }

{
	imports = 
	[ # Include the results of the hardware scan
		./hardware-configuration.nix
	];

	# Use the systemd-boot EFI boot loader.
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Networking
	networking.hostname = "alberto";
	networking.wireless.enable = true;
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "Europe/Rome";

	# Select internationalization properties
	i 18n.defaultLocale = "en_US.UTF-8";
	console = {
		font = "Lat2-Terminus16";
	#        keyMap = "us";
		useXkbConfig = true; # use xkb.options in tty
	};

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment.systemPackages = with pkgs; [
		vim
	];
	
	# System state
	#system.stateVersion = "24.11";
}
	
