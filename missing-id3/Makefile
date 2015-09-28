TARGET=missing-id3
SYSTEM=missing-id3
SOURCES=missing-id3.lisp package.lisp

all:	${TARGET}

${TARGET}:	${SOURCES}
	buildapp --output ${TARGET} --load-system ${SYSTEM} --entry ${SYSTEM}:main

clean:
	rm -f ${TARGET}

install:	${TARGET}
	cp ${TARGET} ${HOME}/bin/

