QUICKLISP_DIR=${HOME}/.quicklisp
BIN_DIR=${HOME}/bin

all:	fx

fx:	fx.lisp
	cl-launch -Q --output fx --dump ! --load-system fx -DE /fx:main -DE gbp/fx:gbp -DE usd/fx:usd

.PHONY:	clean
clean:
	@rm -f fx

.PHONY:	install
install:	fx
	cp fx ${BIN_DIR}/fx
	rm -f ${BIN_DIR}/gbp
	ln -s ${BIN_DIR}/fx ${BIN_DIR}/gbp
	rm -f ${BIN_DIR}/usd
	ln -s ${BIN_DIR}/fx ${BIN_DIR}/usd
