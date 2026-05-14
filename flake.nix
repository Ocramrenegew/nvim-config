{
    description = "Neovim configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, ... }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in {
        packages.${system}.default = pkgs.neovim;

        homeManagerModules.default = { ... }: {
            home.packages = [ pkgs.neovim ];
            home.file.".config/nvim".source =
                config.lib.file.mkOutOfStoreSymlink /home/marcow/nvim-config;
        };
    };
}