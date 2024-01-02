library(dplyr)

meta_diploperennis<-read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/meta/ADN_pasap_diploperennis.txt", header = TRUE)

INDIV_diploperennis<-data.frame(meta_diploperennis$INDIV)

write.table(INDIV_diploperennis,file="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/meta/id_diploperennis.txt", quote=FALSE, sep="\t", 
            col.names = FALSE, row.names = FALSE)
