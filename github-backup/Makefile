BINDIR=${HOME}/bin
TARGET=github-backup
SYSTEM=github-backup
SOURCES=github-backup.lisp

all:	${SOURCES}
	cl-launch -Q --dump ! --output ${TARGET} --load-system ${SYSTEM} --entry ${SYSTEM}:main

.PHONY:	clean
clean:
	rm -f ${TARGET}

.PHONY:	install
install:	${TARGET}
	cp ${TARGET} ${BINDIR}


