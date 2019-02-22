#!/bin/bash
# primeiro vou até o diretório
cd ~/Documentos/enem/DADOS
# primeiro preciso verificar o tipo de arquivo que tenho
#file - i MICRODADOS_ENEM_2017.csv
# Preciso do nome das variáveis
head -1 MICRODADOS_ENEM_2017.csv > enem2017.csv
# aqui vou usar iconv para mudar a codificação e em seguida vou usar o awk para pegar todos os municipios do paraná
iconv -f iso-8859-1 -t UTF-8 MICRODADOS_ENEM_2017.csv | awk -F ";" '{if ($5 == 41)  print $0}' >> enem2017.csv
#encaminho para a minha nova pasta de trabalho
mv enem2017.csv ~/Documentos/tcc
