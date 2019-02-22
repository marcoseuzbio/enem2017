#!/bin/bash
#primeiro vou até a pasta
cd /home/marcos/Documentos/Microdados_Censo_Escolar_2017/DADOS
# primeiro extrair documento
unzip  ESCOLAS.zip 
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
mv escolas.csv ~/Documentos/tcc
