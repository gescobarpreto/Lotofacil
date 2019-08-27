
#!/bin/bash


wget http://www1.caixa.gov.br/loterias/_arquivos/loterias/D_lotfac.zip

unzip D_lotfac.zip

rm D_lotfac.zip


w3m -dump d_lotfac.htm > dados.txt

grep "^[0-9]" dados.txt > dados1.txt

cat dados1.txt | cut -d, -f1-17

