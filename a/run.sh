#!/bin/bash

#Symbol table location
SYMBOL_FILE=../syms.txt

################### simbolos ################
#
# Compila e gera a versão gráfica do transdutor mmm2mm exercicio 1a)
fstcompile --isymbols=$SYMBOL_FILE --osymbols=$SYMBOL_FILE  mmm2mm.txt | fstarcsort > mmm2mm.fst
fstdraw    --isymbols=$SYMBOL_FILE --osymbols=$SYMBOL_FILE --portrait mmm2mm.fst | dot -Tpdf  > mmm2mm.pdf
