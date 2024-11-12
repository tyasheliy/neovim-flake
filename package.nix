{ lib, pkgs, inputs, ... }: 
	let
		fromInput = i: name: pkgs.vimUtils.buildVimPlugin {
			name = name;
			src = i;
		};

		source = lib.fileset.toSource {
			root = ./lua;
			fileset = ./lua;
		};

		configEntries = builtins.readDir ./lua;
		configFilenames = builtins.attrNames configEntries;
		luaFiles = builtins.map (file: "luafile ${source}/${file}") configFilenames;

		neovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
			configure = {
				customRC = (builtins.concatStringsSep "\n" luaFiles);

				packages.all.start = with pkgs.vimPlugins; [
					telescope-nvim
					telescope-fzf-native-nvim

					# kanagawa-nvim
					gruber-darker-nvim

					nvim-cmp
					cmp-nvim-lsp
					luasnip
					nvim-lspconfig
					nvim-treesitter.withAllGrammars
					which-key-nvim
					nvim-ts-autotag
					nvim-treesitter-context
					oil-nvim
					comment-nvim
					neo-tree-nvim
					nvim-surround
					lsp_signature-nvim
					(fromInput inputs.toggleterm "toggleterm")

					nvim-dap
					nvim-dap-ui
					nvim-dap-go
				];
			};
		};

		deps = with pkgs; [
			lua-language-server
			phpactor
			gopls
			delve
		];
	in pkgs.writeShellApplication {
		name = "nvim";
		runtimeInputs = deps;
		text = ''${neovim}/bin/nvim "$@"'';
	}
