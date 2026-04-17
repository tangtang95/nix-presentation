{ pkgs }:
let
  world = "world";
  y = x + 1;
  x = 3;
in
pkgs.writeShellScriptBin "hello" ''
  ${pkgs.cowsay}/bin/cowsay "hello ${world} ${toString (y * 2)}!"
''

