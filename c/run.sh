#!/bin/bash
source ../generic.sh

################### simbolos ################
#
# Compila e gera a versão gráfica do transdutor en2pt e pt2en exercicio 1.b)
compile dia
compile mes
#compile ano

# Compila o trasdutor que converte numeros para extenso entre 1 e 99 (para posteriormente criar o ano)
compile nn
# O FST dia já contem o extenso de números entre 1 e 31, assim reaproveita-se isso e junta-se o restante
fstunion dia.fst nn.fst > 1_99nn.fst

# Testes
echo "** Testes:"

echo -n "teste01: "
echo ""
compile teste01
fstcompose teste01.fst dia.fst > composedia.fst
echo -n "O dia 01 é: "
show composedia
echo ""
echo -n "O mes 01 é: "
fstcompose teste01.fst mes.fst > composemes.fst
show composemes
echo ""
echo ""


echo -n "teste1: "
echo ""
compile teste1
fstcompose teste1.fst dia.fst > composedia.fst
echo -n "O dia 1 é: "
show composedia
echo ""
echo -n "O mes 1 é: "
fstcompose teste1.fst mes.fst > composemes.fst
show composemes
echo ""
echo ""


echo -n "teste10: "
echo ""
compile teste10
fstcompose teste10.fst dia.fst > composedia.fst
echo -n "O dia 10 é: "
show composedia
echo ""
echo -n "O mes 10 é: "
fstcompose teste10.fst mes.fst > composemes.fst
show composemes
echo ""
echo ""

echo -n "teste11: "
echo ""
compile teste11
fstcompose teste11.fst dia.fst > composedia.fst
echo -n "O dia 11 é: "
show composedia
echo ""
echo -n "O mes 11 é: "
fstcompose teste11.fst mes.fst > composemes.fst
show composemes
echo ""
echo ""

echo -n "NN: O numero 42 por extenso é:"
compile testeNN42
fstcompose testeNN42.fst nn.fst > NN42.fst
show NN42
echo ""

echo -n "NN: O numero 70 por extenso é:"
compile testeNN70
fstcompose testeNN70.fst nn.fst > NN70.fst
show NN70
echo ""