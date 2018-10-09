#!/bin/bash
source ../generic.sh

#Compilacao dos transdutores base
compile barra
draw barra


#alinea a. 
#mmm2mm
compile mmm2mm
draw mmm2mm

#misto2numerico
compile dd
draw dd
fstconcat dd.fst mmm2mm.fst > ddmmm2mm.fst
draw ddmmm2mm
compile aaaa
draw aaaa
fstconcat ddmmm2mm.fst aaaa.fst > misto2numerico.fst
draw misto2numerico

#alinea b
#en2pt
compile en2pt_m
draw en2pt_m
fstconcat dd.fst en2pt_m.fst > dden2pt_m.fst
draw dden2pt_m
fstconcat dden2pt_m.fst aaaa.fst > en2pt.fst
draw en2pt

#pt2en
#Ja criamos o en2pt portanto e' so' inverter (o output passa a input e input a output)
fstinvert en2pt_m.fst > pt2en_m.fst
draw pt2en_m
fstconcat dd.fst pt2en_m.fst > ddpt2en_m.fst
draw dden2pt_m
fstconcat ddpt2en_m.fst aaaa.fst > pt2en.fst
draw pt2en

#alinea c
#dia
#O FST dia é uma união dos números [1; 29] com [30; 31]
compile 1_29nn
draw 1_29nn
compile 30_31nn
draw 30_31nn
fstunion 1_29nn.fst 30_31nn.fst > dia.fst
draw dia

#mes
compile mes
draw mes

#ano
# Compila o trasdutor que converte numeros para extenso entre 1 e 99 (para posteriormente criar o ano)
compile nn
draw nn
# O FST 1_29 já contem o extenso de números entre 1 e 29, assim reaproveita-se isso e junta-se o restante
fstunion 1_29nn.fst nn.fst > 1_99nn.fst
# Seculo FST contem o necessário para traduzir os primeiros dois digitos do ano: 20xx -> dois mil e ...
compile seculo
draw seculo
# O FST ano e' então uma concatenção do século com o FST 1_99nn (que traduz números entre 1 e 99)
fstconcat seculo.fst 1_99nn.fst > ano.fst
draw ano

#numerico2texto
compile barra
draw barra
fstconcat dia.fst barra.fst > diabarra.fst
draw diabarra
fstconcat diabarra.fst mes.fst > diames.fst
draw diames
fstconcat diames.fst barra.fst > diamesbarra.fst
draw diamesbarra
fstconcat diamesbarra.fst ano.fst > numerico2texto.fst 
draw numerico2texto

#alinea d.
#misto2texto
fstcompose mmm2mm.fst mes.fst > mistomm.fst
draw mistomm
fstconcat diabarra.fst mistomm.fst > diames.fst
draw diames
fstconcat diames.fst barra.fst > diamesbarra.fst
draw diamesbarra
fstconcat diamesbarra.fst ano.fst > misto2texto.fst 
draw misto2texto

#data2texto
fstunion mistomm.fst mes.fst > mistonummes.fst
draw mistonummes
fstconcat diabarra.fst mistonummes.fst > diamesdata2texto.fst
draw diamesdata2texto
fstconcat diamesdata2texto.fst barra.fst > diamesbarradata2texto.fst
draw diamesbarradata2texto
fstconcat diamesbarradata2texto.fst ano.fst > data2texto.fst 
draw data2texto