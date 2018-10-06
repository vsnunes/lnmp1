#!/bin/bash

# This file contains a simplification of function calls to make invocations more clear

#Symbol table location
SYMBOL_FILE=../syms.txt

#Compile a FST
# Arg1: the name of the file without extension
function compile {
        fstcompile --isymbols=$SYMBOL_FILE --osymbols=$SYMBOL_FILE  $1.txt | fstarcsort > $1.fst
}

#Draw in PDF the FST
# Arg1: the name of the file without extension
function draw {
        fstdraw    --isymbols=$SYMBOL_FILE --osymbols=$SYMBOL_FILE --portrait $1.fst | dot -Tpdf  > $1.pdf
}

#Show to stdout the result of a FST
# Arg1: the name of the file without extension
function show {
    fstproject --project_output $1.fst | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=$SYMBOL_FILE | awk 'BEGIN { ORS="" }; {print $3}'
}
