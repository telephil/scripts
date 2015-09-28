QUICKLISP_DIR=${HOME}/.quicklisp
BIN_DIR=${HOME}/bin

all:	fx

manifest.txt:
	sbcl --no-userinit --no-sysinit --non-interactive \
		--load ${QUICKLISP_DIR}/setup.lisp        \
		--eval '(ql:quickload "drakma")'	  \
		--eval '(ql:write-asdf-manifest-file "manifest.txt")'

fx:	manifest.txt fx.asd fx.lisp
	buildapp --output fx 			\
		 --manifest-file manifest.txt 	\
		 --load-system drakma		\
		 --load-system fx 		\
		 --dispatched-entry /fx:main 	\
		 --dispatched-entry gbp/fx:gbp 	\
		 --dispatched-entry usd/fx:usd

install:	fx
	cp fx ${BIN_DIR}/fx
	ln -s ${BIN_DIR}/fx ${BIN_DIR}/gbp
	ln -s ${BIN_DIR}/fx ${BIN_DIR}/usd

clean:
	@rm -f manifest.txt fx
