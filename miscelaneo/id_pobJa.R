meta_Jalisco <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/meta_Jalisco.txt", header = TRUE)
Indiv_poblacionJa <-data.frame(meta_Jalisco$INDIV, meta_Jalisco$LUGAR)
write.table(Indiv_poblacionJa,file="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/Id_pobJa.txt", quote=FALSE, sep="\t", 
            col.names = TRUE, row.names = FALSE)
