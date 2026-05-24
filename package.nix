{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  pname   = "dwl";
  version = "0.8-custom";

  src = pkgs.fetchFromGitHub {
    owner  = "L-PDufour";
    repo   = "dwl";
    rev    = "fc7f4e6";
    hash   = "sha256-xbzzAsCnJwkdAn6T+29OodX+YCgM3nFTYh0/FWaTUPw=";
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
    libx11
    libxcursor
    libxcb
    libxcb-wm
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
