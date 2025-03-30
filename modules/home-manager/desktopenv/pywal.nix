{ config, lib, pkgs, ... }:

let
  walCache = "${config.xdg.cacheHome}/wal";
  wallpaper = "${config.home.homeDirectory}/Pictures/wallpaper.jpg";
in
{
  options = {
    pywal.enable = lib.mkEnableOption "Enable pywal theming";
  };

  config = lib.mkIf config.pywal.enable {
    home.packages = with pkgs; [ wal ];

    # Ensure colors are available system-wide
    home.sessionVariables = {
      PYWAL_CACHE = "${walCache}/colors.sh";
    };

    # Generate and apply Pywal colors declaratively
    home.activation.pywal = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if [ -f "${wallpaper}" ]; then
        ${pkgs.wal}/bin/wal -i ${wallpaper} -q
      fi
    '';

    # Ensure Pywal color files are linked to standard locations
    home.file = {
      "${walCache}/colors.sh".source = "${walCache}/colors.sh";
      "${walCache}/colors-kitty.conf".source = "${walCache}/colors-kitty.conf";
    };

    # Systemd service to reload colors at login
    systemd.user.services.pywal = {
      Unit = {
        Description = "Apply pywal theme on startup";
        After = [ "graphical-session.target" ];
      };
      Service = {
        ExecStart = "${pkgs.wal}/bin/wal -R -q";
        Restart = "always";
      };
      Install = { WantedBy = [ "default.target" ]; };
    };
  };
}
