{ pkgs ? import <nixpkgs> { } }:

let f = { buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "protoc-gen-go";
  version = "1.27.1";

  src = fetchFromGitHub {
    owner = "protocolbuffers";
    repo = "protobuf-go";
    rev = "v${version}";
    sha256 = "0aszb7cv8fq1m8akgd4kjyg5q7g5z9fdqnry6057ygq9r8r2yif2";
  };

  vendorSha256 = "0rhgx3zkxp9gg4q7vck6x0ps5fp67lc0swbrgbpsghhribi2bgy9";

  subPackages = [ "cmd/protoc-gen-go" ];
};

in pkgs.callPackage f {}
