{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		toggleterm = {
			url = "github:akinsho/toggleterm.nvim";
			flake = false;
		};
	};

	outputs = { nixpkgs, ... }@inputs: 
	let
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system; };
		neovim = import ./package.nix {
			inherit pkgs;
			lib = nixpkgs.lib;
			inherit inputs;
		};
	in {
		packages.${system}.default = neovim;

		apps.${system}.default = {
			type = "app";
			program = "${neovim}/bin/nvim";
		};
	};
}
