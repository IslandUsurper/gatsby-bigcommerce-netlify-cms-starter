let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
  node2nix = pkgs.callPackage sources.node2nix {};
  nodePackages = import ./nix/dev.nix { inherit pkgs; };
in
pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs-10_x
    nodePackages."gatsby-cli"
    nodePackages."netlify-cli"
    node2nix.package
  ];
}
