################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="lxml"
PKG_VERSION="3.2.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE=""
PKG_SITE="http://lxml.de/"
PKG_URL="https://pypi.python.org/packages/source/l/lxml/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS="Python"
PKG_BUILD_DEPENDS="toolchain Python distutilscross libxslt"
PKG_PRIORITY="optional"
PKG_SECTION="python/system"
PKG_SHORTDESC="lxml - XML and HTML with Python"
PKG_LONGDESC="lxml - XML and HTML with Python"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
        export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
        export CFLAGS="$CFLAGS -I$SYSROOT_PREFIX/usr/include/libxml2"
        export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib -name "*.py" -exec rm -rf "{}" ";"
}
