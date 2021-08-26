{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    (callPackage ./golangci-lint { inherit pkgs; })
    (callPackage ./protoc-gen-go { inherit pkgs; })
  ];
}
