#!/bin/bash
source ../generic.sh

################### simbolos ################
#
# Compila e gera a versão gráfica do transdutor mmm2mm exercicio 1a)
compile mmm2mm
draw    mmm2mm

# Testes
echo "** Testes:"

echo -n "testeJAN: "
compile testeJAN
#fstrmepsilon testeJAN.fst | fsttopsort | fstprint --isymbols=$SYMBOL_FILE
fstcompose testeJAN.fst mmm2mm.fst  | fstarcsort > composeJAN.fst
echo -n "O formato decimal de JAN é: "
fstproject --project_output composeJAN.fst | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=$SYMBOL_FILE | awk 'BEGIN { ORS="" }; {print $3}'
echo " "
