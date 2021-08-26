{ pkgs ? import <nixpkgs> { } }:

let f = { buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "golangci-lint";
  version = "1.42.0";

  src = fetchFromGitHub {
    owner = "golangci";
    repo = "golangci-lint";
    rev = "v${version}";
    sha256 = "1wca6bfpwakmjfj9v64br99k33pz9cl1nrl6j63zw0zdc1ymj0n7";
  };

  vendorSha256 = "115z715qy8wicg0kmc71h1dn03ilkkypv17ghiynyn0w2k5ldrcl";

  subPackages = [ "cmd/golangci-lint" ];
};

in pkgs.callPackage f {}
