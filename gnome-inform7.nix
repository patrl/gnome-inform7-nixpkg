{ stdenv, fetchFromGitHub, automake, autoconf, libtool, gettext, git, autoreconfHook, pkgconfig, itstool, utillinux, gtk3, gtkspell2, libxml2, goocanvas, webkitgtk } :

stdenv.mkDerivation rec {

  name = "gnome-inform7";
  src = fetchFromGitHub {
    owner = "ptomato";
    repo = "gnome-inform7";
    rev = "0352c8688a4676e1d242ac749de277f99e55d3a0";
    sha256 = "1m9kr2myllq5nw0cl7j36rvwxd65p7sg1dqk7hp4swji9b5spjmk";
    fetchSubmodules = true;
  };  
  patches = [ ./changes.patch ./ni.patch ];
  buildInputs = [ gtk3 gtkspell2 automake autoconf gettext libtool utillinux itstool pkgconfig libxml2 goocanvas webkitgtk ];
  preConfigure = "./autogen.sh";
  meta = {
    description = "gnome-inform7";
  };
}
