# modules/home-manager/python.nix

{ config, pkgs, ... }:

let
  # Define your Python version and environment
  pythonVersion = "python3";
  pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    numpy
    pycryptodome
  ]);
in
{
  home.packages = [ pythonEnv ];

  home.sessionVariables = {
    PYTHONPATH = "${pythonEnv}/lib/python${pythonVersion}/site-packages";
  };

  # Enable custom Python shell
  programs.python = {
    enable = true;
    package = pythonEnv;
  };
}
