{ pkgs ? import <nixpkgs> {} }:

let
  elixirPkgsHash = "6cdb0811911557b8d35987c7bc5eb33cda8df6f0"; #Elixir 1_15_2
  erlangPkgsHash = "dc4d580db26690ba375069a73b4fa9fc14b1a64c"; #Erlang 26_0_2

  elixirPkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/${elixirPkgsHash}.tar.gz") {};
  erlangPkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/${erlangPkgsHash}.tar.gz") {};
in
with pkgs;

mkShell {
  buildInputs = [
    cacert
    erlangPkgs.erlang_26
    elixirPkgs.elixir_1_15
    file
    rebar3
    inotify-tools
  ];

  shellHook = ''
    # this allows mix to work on the local directory
    mkdir -p .nix-mix
    mkdir -p .nix-hex
    export MIX_HOME=$PWD/.nix-mix
    export HEX_HOME=$PWD/.nix-hex
    export PATH=$MIX_HOME/bin:$PATH
    export PATH=$HEX_HOME/bin:$PATH
    export LANG=en_US.UTF-8
    export ERL_AFLAGS="-kernel shell_history enabled"

    # Load locally defined ENV vars
    # source .env_dev.sh
  '';
}
