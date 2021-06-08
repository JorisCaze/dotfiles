#!/bin/bash

# Allow to add menu item for Gmsh software
# Requires to move 

# Resolve the location of the Gmsh installation.
# This includes resolving any symlinks.
PRG=$0
while [ -h "$PRG" ]; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '^.*-> \(.*\)$' 2>/dev/null`
    if expr "$link" : '^/' 2> /dev/null >/dev/null; then
        PRG="$link"
    else
        PRG="`dirname "$PRG"`/$link"
    fi
done

GMSH_BIN=`dirname "$PRG"`

# Absolutize dir
oldpwd=`pwd`
cd "${GMSH_BIN}"
GMSH_BIN=`pwd`
cd "${oldpwd}"

# Move Gmsh icon to bin folder
mv "${GMSH_BIN}/../share/doc/gmsh/tutorial/image.png" "${GMSH_BIN}"
mv "${GMSH_BIN}/image.png" "${GMSH_BIN}/gmsh-64.png" 

ICON_NAME=gmsh-gmsh
TMP_DIR=`mktemp --directory`
DESKTOP_FILE=$TMP_DIR/gmsh-gmsh.desktop
cat << EOF > $DESKTOP_FILE
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Name=Gmsh
Keywords=Mesh
Comment=Mesh tool
Type=Application
Categories=CFD
Terminal=false
StartupWMClass=Gmsh
Exec="$GMSH_BIN/gmsh" %u
MimeType=x-scheme-handler/gmsh;
Icon=$ICON_NAME.png
EOF

# To refresh immediately
chmod 644 $DESKTOP_FILE

xdg-desktop-menu install $DESKTOP_FILE
xdg-icon-resource install --size 64 "$GMSH_BIN/gmsh-64.png" $ICON_NAME

rm $DESKTOP_FILE
rm -R $TMP_DIR
