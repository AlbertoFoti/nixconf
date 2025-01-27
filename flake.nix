{
	description = "Arstneio nixOS";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager/master";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { nixpkgs, ... } @ inputs:
	let
		pkgs = nixpkgs.legacyPackages.x86_64-liddnux;
	in
	{
		nixosConfigurations.arstneio = nixpkgs.lib.nixosSystem {
			modules = [
				./configuration.nix
			];
		};

		#packages.x86_64-linux.hello = pkgs.hello;
		#packages.x86_64-linux.default = pkgs.hello;

		devShells.x86_64-linux.default = pkgs.mkShell {
			buildInputs = [ pkgs.neovim ];
		};
	};
}
