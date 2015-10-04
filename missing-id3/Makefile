BINDIR=${HOME}/bin
TARGET=missing-id3
SYSTEM=missing-id3
SOURCES=missing-id3.lisp

all:	missing-id3.lisp
	cl-launch -Q --output ${TARGET} --load-system ${SYSTEM} --entry ${SYSTEM}:main

.PHONY:	clean
clean:
	rm -f ${TARGET}

.PHONY:	install
install:	${TARGET}
	cp ${TARGET} ${BINDIR}

