#!/bin/bash
source ../generic.sh

################### simbolos ################
#
# Compila e gera a versão gráfica do transdutor en2pt e pt2en exercicio 1.b)

#FST com extenso de 1 a 29.
compile 1_29nn

#FST com extenso de 30 e 31.
#Porquê separar? Porque queremos aproveitar o anterior [1; 29] para o ano (linha 23 deste script)
compile 30_31nn

# O FST dia é uma união dos números [1; 29] com [30; 31]
fstunion 1_29nn.fst 30_31nn.fst > dia.fst

compile mes

# Compila o trasdutor que converte numeros para extenso entre 1 e 99 (para posteriormente criar o ano)
compile nn
# O FST dia já contem o extenso de números entre 1 e 29, assim reaproveita-se isso e junta-se o restante
fstunion 1_29nn.fst nn.fst > 1_99nn.fst

# Seculo FST contem o necessário para traduzir os primeiros dois digitos do ano: 20xx -> dois mil e ...
compile seculo

# O FST ano e' então uma concatenção do século com o FST 1_99nn (que traduz números entre 1 e 99)
fstconcat seculo.fst 1_99nn.fst > ano.fst

#Criacao de numerico2texto.fst
compile barra
fstconcat dia.fst barra.fst > diabarra.fst
fstconcat diabarra.fst mes.fst > diames.fst
fstconcat diames.fst barra.fst > diamesbarra.fst
fstconcat diamesbarra.fst ano.fst > numerico2texto.fst 
draw numerico2texto

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

echo -n "ANO: O ano 2018 por extenso é:"
compile testeANO2018
fstcompose testeANO2018.fst ano.fst > ANO2018.fst
show ANO2018
echo ""

echo -n "ANO: O ano 2007 por extenso é:"
compile testeANO2007
fstcompose testeANO2007.fst ano.fst > ANO2007.fst
show ANO2007
echo ""

echo -n "numerico2texto: A data por extenso é:"
compile mistoTiago
fstcompose mistoTiago.fst numerico2texto.fst > 18Tiago.fst
show 18Tiago
echo ""

echo -n "numerico2texto: A data por extenso é:"
compile mistoVitor
fstcompose mistoVitor.fst numerico2texto.fst > 18Vitor.fst
show 18Vitor
echo ""