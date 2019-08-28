
#!/bin/bash


wget http://www1.caixa.gov.br/loterias/_arquivos/loterias/D_lotfac.zip

unzip D_lotfac.zip

rm D_lotfac.zip


#w3m -dump d_lotfac.htm > dados.txt

#grep "^[0-9]" dados.txt > dados1.txt

#w3m -dump d_lotfac.htm |grep "^[0-9]" |tr -s " "|sed -e 's/^[ t]*//' -e 's/ /,/g' > dados.txt

#cat dados.txt | cut -d, -f1-17 > dados1.txt

w3m -dump d_lotfac.htm |grep "^[0-9]" |tr -s " "|sed -e 's/^[ t]*//' -e 's/ /,/g' |cut -d, -f1-17 > dados.txt

rm d_lotfac.htm d_lotfac.gif


