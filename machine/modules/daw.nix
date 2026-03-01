let
  nix-user = "alice";
in
{
  imports = 
    [
      /absolute/path
    ];
  musnix.enable = true;

  users.users."${nix-user}".extraGroups = [
    "audio" #musnix
  ];
}