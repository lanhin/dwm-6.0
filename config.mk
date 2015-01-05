# dwm version
VERSION = 6.0

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# Xinerama
XINERAMALIBS = -L${X11LIB} -lXinerama
XINERAMAFLAGS = -DXINERAMA

# Xft
XFTINC = -I/usr/include/freetype2
XFTLIBS = -L${X11LIB} -lXft
XFTFLAGS = -DXFT

# includes and libs
INCS = -I. -I/usr/include -I${X11INC} ${XFTINC}
LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 ${XINERAMALIBS} ${XFTLIBS}

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS} ${XFTFLAFS}
#CFLAGS = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
#LDFLAGS = -g ${LIBS}
LDFLAGS = -s ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC = cc
