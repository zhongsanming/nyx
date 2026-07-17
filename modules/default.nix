# Main module hub: auto-imports all .nix files from sub-directories.
{ }:
let
  importDir = dir:
    let
      found = builtins.pathExists dir;
      nixFiles =
        if found then
          let files = builtins.readDir dir;
          in builtins.filter (name: builtins.match ".*\\.nix" name != null)
            (builtins.attrNames files)
        else [ ];
    in map (name: dir + "/${name}") nixFiles;
in
{
  imports =
    importDir ./.
    ++ importDir ./profiles
    ++ importDir ./programs
    ++ importDir ./services
    ++ importDir ./settings
    ++ importDir ./hosts
    ++ importDir ./hosts/nyx
    ++ importDir ./users
    ++ importDir ./users/serephus
    ++ importDir ./templates;
}
