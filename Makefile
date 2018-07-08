ETCDIR	= /etc
BINDIR	= /usr/bin
EXTDIR	= ${DESTDIR}${ETCDIR}
EBINDIR	= ${DESTDIR}${BINDIR}

RCFILES	= rc.sysinit rc.local rc.single rc.multi rc.shutdown

create-dirs:
	install -d -m 755 ${EXTDIR}/rc.d/ ${EXTDIR}/conf.d/

create-bin-dir:
	install -d -m 755 ${EBINDIR}

install: create-dirs create-bin-dir
	install -m 754 ${RCFILES} ${EXTDIR}
	install -m 644 inittab rc.conf ${EXTDIR}
	install -m 755 rc ${EBINDIR}

install-daemon: create-dirs
	install -m 755 rc.d/* ${EXTDIR}/rc.d/
	install -m 644 conf.d/* ${EXTDIR}/conf.d/

install-all: install install-daemon
