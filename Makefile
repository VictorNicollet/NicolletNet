www: make.native
	./make.native

make.native: gen

gen: 
	ocamlbuild -use-ocamlfind make.native

all: gen www