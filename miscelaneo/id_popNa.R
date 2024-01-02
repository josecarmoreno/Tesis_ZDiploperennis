meta_Nayarit <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/meta_Nayarit.txt", header = TRUE)
Indiv_poblacionNa <-data.frame(meta_Nayarit$INDIV, meta_Nayarit$LUGAR)
write.table(Indiv_poblacionNa,file="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/Id_pobNa.txt", quote=FALSE, sep="\t", 
            col.names = TRUE, row.names = FALSE)

