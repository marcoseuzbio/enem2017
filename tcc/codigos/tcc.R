#!/usr/bin/env Rscript
a<-read.csv2("enem2017.csv")
b<-read.csv2("escolas.csv")
colnames(b)[2] <- toString(colnames(a)[21])
c <- merge(a,b,by="CO_ESCOLA")
write.csv(c , file = "enem.csv")
