TARGET=github-backup
SYSTEM=github-backup
SOURCES=github-backup.lisp package.lisp

all:	${TARGET}

${TARGET}:	${SOURCES}
	buildapp --output ${TARGET} --load-system ${SYSTEM} --entry ${SYSTEM}:main

clean:
	rm -f ${TARGET}

install:	${TARGET}
	cp ${TARGET} ${HOME}/bin/

