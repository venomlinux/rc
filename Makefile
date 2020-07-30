ETCDIR	= /etc
BINDIR	= /usr/bin
EXTDIR	= ${DESTDIR}${ETCDIR}
EBINDIR	= ${DESTDIR}${BINDIR}

RCFILES	= rc rc.local rc.single rc.multi rc.shutdown rc.subr

create-dirs:
	install -d -m 755 ${EXTDIR}/rc.d/

create-bin-dir:
	install -d -m 755 ${EBINDIR}

install: create-dirs create-bin-dir
	install -m 754 ${RCFILES} ${EXTDIR}
	install -m 644 inittab rc.conf ${EXTDIR}
	install -m 755 modules-load ${EBINDIR}

install-daemon: create-dirs
	install -m 755 rc.d/* ${EXTDIR}/rc.d/

install-all: install install-daemon
