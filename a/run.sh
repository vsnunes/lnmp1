#!/bin/bash
source ../generic.sh

################### simbolos ################
#
# Compila e gera a versão gráfica do transdutor mmm2mm e misto2numerico exercicio 1a)
compile dd
compile mmm2mm
compile aaaa
draw mmm2mm
fstconcat dd.fst mmm2mm.fst > ddmmm2mm.fst
fstconcat ddmmm2mm.fst aaaa.fst > misto2numerico.fst
draw misto2numerico

# Testes
echo "** Testes:"

echo -n "testeJAN: "
compile testeJAN
compile testeMISTO

#fstrmepsilon testeJAN.fst | fsttopsort | fstprint --isymbols=$SYMBOL_FILE
fstcompose testeJAN.fst mmm2mm.fst  | fstarcsort > composeJAN.fst
fstcompose testeMISTO.fst misto2numerico.fst | fstarcsort > compose25122018.fst
echo -n "O formato decimal de JAN é: "
show composeJAN
echo " "
echo -n "O formato numeral de 25/DEZ/2018 é: "
show compose25122018
echo " "