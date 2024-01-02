metadatos_Zdiploperennis<-data.frame(meta_diploperennis$INDIV, meta_diploperennis$POB, meta_diploperennis$Parc, meta_diploperennis$LATITUDE, meta_diploperennis$LONGITUDE, meta_diploperennis$ALT, meta_diploperennis$ESTADO, meta_diploperennis$MUNICIPIO, meta_diploperennis$LUGAR, meta_diploperennis$ACCESION)
write.table(metadatos_Zdiploperennis,file="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/metadatos_Zdiploperennis.txt", quote=FALSE, sep="\t", 
            col.names = TRUE, row.names = FALSE)
