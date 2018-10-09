#!/bin/bash
source ../generic.sh

compile 1_29nn
compile 30_31nn
fstunion 1_29nn.fst 30_31nn.fst > dia.fst

compile mmm2mm
compile mes

compile nn
fstunion 1_29nn.fst nn.fst > 1_99nn.fst
compile seculo
fstconcat seculo.fst 1_99nn.fst > ano.fst

compile barra
fstconcat dia.fst barra.fst > diabarra.fst
fstcompose mmm2mm.fst mes.fst > mistomm.fst
fstconcat diabarra.fst mistomm.fst > diames.fst
fstconcat diames.fst barra.fst > diamesbarra.fst
fstconcat diamesbarra.fst ano.fst > misto2texto.fst 
draw misto2texto

fstunion mistomm.fst mes.fst > mistonummes.fst
fstconcat diabarra.fst mistonummes.fst > diamesdata2texto.fst
fstconcat diamesdata2texto.fst barra.fst > diamesbarradata2texto.fst
fstconcat diamesbarradata2texto.fst ano.fst > data2texto.fst 
draw data2texto