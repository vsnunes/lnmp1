#!/bin/bash
source ../generic.sh

################### simbolos ################
#
# Compila e gera a versão gráfica do transdutor en2pt e pt2en exercicio 1.b)
compile dd
compile en2pt_m

# We already create the english 2 portuguese then we invert it to do pt2en
fstinvert en2pt_m.fst > pt2en_m.fst

compile aaaa
fstconcat dd.fst en2pt_m.fst > dden2pt_m.fst
fstconcat dden2pt_m.fst aaaa.fst > en2pt.fst
draw en2pt
fstconcat dd.fst pt2en_m.fst > ddpt2en_m.fst
fstconcat ddpt2en_m.fst aaaa.fst > pt2en.fst
draw pt2en

# Testes
echo "** Testes:"

echo -n "teste25DEC2018: "
compile teste25DEC2018
compile teste25DEZ2018

#fstrmepsilon testeJAN.fst | fsttopsort | fstprint --isymbols=$SYMBOL_FILE
fstcompose teste25DEC2018.fst en2pt.fst | fstarcsort > compose25DEC2018.fst
fstcompose teste25DEZ2018.fst pt2en.fst > compose25DEZ2018.fst


echo -n "O formato pt de 25/DEC/2018 é: "
show compose25DEC2018
echo " "
echo -n "O formato en de 25/DEZ/2018 é: "
show compose25DEZ2018
echo " "