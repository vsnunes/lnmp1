#!/bin/bash
source run.sh

# Intensive Tester for year
A1=2
A2=0
A3=0
A4=1

for ((A3=0;A3<=9;A3++)); do
    for ((A4=1;A4<=9;A4++)); do
        echo -e "0\t1\t$A1\t$A1\n1\t2\t$A2\t$A2\n2\t3\t$A3\t$A3\n3\t4\t$A4\t$A4\n4" > /tmp/test.txt
        echo -en "ANO $A1$A2$A3$A4:"
        compile /tmp/test
        fstcompose /tmp/test.fst ano.fst > testANO.fst
        show testANO
        echo ""
    done
done