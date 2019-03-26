#!/usr/bin/env Rscript
enem2017<-read.csv2("enem2017.csv")
escolas<-read.csv2("escolas.csv")
colnames(escolas)[2] <- toString(colnames(enem2017)[21])
enem <- merge(enem2017,enem2017,by="CO_ESCOLA")
head(enem2017)
