{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname   = "dwl";
  version = "0.8-custom";

  src = pkgs.fetchFromGitHub {
    owner  = "L-PDufour";
    repo   = "dwl";
    rev    = "a88daf8";
    hash   = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  nativeBuildInputs = with pkgs; [
    pkg-config
    wayland-scanner
  ];

  buildInputs = with pkgs; [
    wlroots_0_19
    wayland
    wayland-protocols
    xwayland
    libinput
    libxkbcommon
    pixman
    # XWayland / X11 support
    xorg.libX11
    xorg.libXcursor
    xorg.libxcb
    xorg.xcbutilwm
  ];

  makeFlags = [ "PREFIX=$(out)" ];

  meta = {
    description  = "Dynamic tiling Wayland compositor based on dwm";
    homepage     = "https://github.com/L-PDufour/dwl";
    license      = pkgs.lib.licenses.gpl3Only;
    platforms    = pkgs.lib.platforms.linux;
    mainProgram  = "dwl";
  };
}
