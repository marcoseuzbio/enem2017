#!/bin/bash
# first i download the countend
wget -c http://download.inep.gov.br/microdados/microdados_enem2017.zip
wget -c http://download.inep.gov.br/microdados/micro_censo_escolar_2017.zip
# Now, extract countends
unzip -n  microdados_enem2017.zip
unzip -n  micro_censo_escolar_2017.zip
# go to file  on enem
cd 'Microdados Enem 2017'/DADOS 
#file - i MICRODADOS_ENEM_2017.csv
# Preciso do nome das variáveis
head -1 MICRODADOS_ENEM_2017.csv > enem2017.csv
# aqui vou usar iconv para mudar a codificação e em seguida vou usar o awk para pegar todos os municipios do paraná
iconv -f iso-8859-1 -t UTF-8 MICRODADOS_ENEM_2017.csv | awk -F ";" '{if ($5 == 41)  print $0}' >> enem2017.csv
#encaminho para a minha nova pasta de trabalho
mv enem2017.csv ~/Documentos/enem2017/tcc/codigos
#primeiro vou até a pasta
cd ~/Documentos/enem2017/tcc/codigos/Microdados_Censo_Escolar_2017/DADOS
# primeiro extrair documento
unzip -n  ESCOLAS.zip 
# primeiro preciso verificar o tipo de arquivo que tenho
file -i ESCOLAS.CSV
# aqui vou usar iconv para mudar a codificação e em seguida vou usar o awk para pegar todos os municipios do paraná
iconv -f iso-8859-1 -t UTF-8 ESCOLAS.CSV > escolas.csv  
# Preciso do nome das variáveis
head -1 escolas.csv > escola.csv
# aqui quero formar o arquivo pegando só curitiba
awk -F "|" '{if ($11 == 41)  print $0}' OFS=";"  escolas.csv >> escola.csv
# definindo o delimitador como ;
sed 's/|/;/g' escola.csv > escolas.csv
#vou remover os arquivos inuteis
rm escola.csv  ESCOLAS.CSV
# mando o arquivo para a minha pasta de trabalho
mv escolas.csv  ~/Documentos/enem2017/tcc/codigos
# come back to folder and excecute tcc.R
chmod +x tcc.R
~/Documentos/enem2017/tcc/codigos/tcc.R

