{
  description = "A Shell that is alos a Container";

  # Specifies the inputs for this flake, such as nixpkgs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-julia.url = "github:NixOS/nixpkgs/?ref=refs/pull/225513/head";
    poetry2nix.url = "github:nix-community/poetry2nix";
  };

  # Use flake-utils to simplify flake outputs for multiple systems
  outputs = { self, julia2nix, poetry2nix, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            poetry2nix.overlays.default
          ];
          config = {
            allowUnfree = true; 
          };
        };
        shell-env = pkgs.buildEnv rec { 
          name = "shell-env";       
          paths = [
          socatsend
          socatreceive
            ];
        };
        socatsend = pkgs.writeShellScriptBin "socatsend" ''
          echo "hello" | ${pkgs.socat}/bin/socat - udp-sendto:255.255.255.255:5000
        '';

        socatreceive = pkgs.writeShellScriptBin "socatreceive" ''
          ${pkgs.socat}/bin/socat - udp4-listen:5000,reuseaddr,fork
        '';

        socat-send-img = pkgs.dockerTools.buildNixShellImage {
          name = "socat-send" ;
          tag = "latest";
          drv = shell;
          command = ''${pkgs.bash}/bin/bash ${socatsend}/bin/socatsend'';
        };
        socat-receive-img = pkgs.dockerTools.buildNixShellImage {
          name = "socat-receive" ;
          tag = "latest";
          drv = shell;
          command = ''${pkgs.bash}/bin/bash ${socatreceive}/bin/socatreceive'';
        };
        shell = pkgs.mkShell {
            buildInputs = [ (shell-env) ];
            shellHook = ''
            echo "Example Shell Container with socat" | ${pkgs.figlet}/bin/figlet
            '';
          };
      in
      {
        packages = {
          socat-send-container = socat-send-img;
          socat-receive-container = socat-receive-img;
        };

        devShells.default = shell;
      }
    );
}

