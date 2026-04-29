{ pkgs }:
let
  world = { foo = "world"; };
  y = x + 1;
  x = 3;
in
pkgs.writeShellScriptBin "hello" ''
  ${pkgs.cowsay}/bin/cowsay "hello ${world.foo} ${toString (y * 2)}!"
''

