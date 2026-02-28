{
  imports = 
    [
      /absoule/path/to/musnix
    ];
  musnix.enable = true;

  users.users.<user>.extraGroups = [
    "audio" #musnix
  ];
}