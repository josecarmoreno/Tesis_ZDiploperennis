library(ggplot2)
library(tidyr)
library(dplyr)
library(readr)

###Estimar el valor óptimo de K
#leer el K error
k.error<- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/admixture/admixtureNa/zdiploperennisNa_Kerror.txt", header = F, sep = ":")
rownames(k.error)<- c("k=1", "k=2", "k=3", "k=4", "k=5", "k=6")

#Hacer el plot para el K error
e.plot<- ggplot(data=k.error, aes(x=1:6, y=V2)) + geom_point() + geom_line()
e.plot + xlab("k") + ylab("Error")

###Hacer el plot para K=2

##Obtener metadatos
samples_meta<-read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/metadatos_Zdiploperennis.txt", 
                         header=TRUE, sep="\t")

samples_names<-read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/diploperennis_data_filtered.fam", header=FALSE, sep=" ") %>%
  select(., V2) %>%
  rename(., INDIV=V2)

#leer el archivo Q 
Qval<-read.table(paste0("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/admixture/diploperennis_data_filtered.4.Q"))
names(Qval)<-paste0("K", 1:ncol(Qval))

#Formato del archivo Q para plotting
#añadir nombres de muestras a la Qtable
Qval<-cbind(INDIV=samples_names$INDIV, Qval)

#transformar a formato largo
Qval_long<- gather(Qval, key=Kgroup, value=Qadmixture, 2:ncol(Qval))

##Plot
#standar
plt<-ggplot(Qval_long, aes(x=INDIV, y=Qadmixture, fill=Kgroup)) + geom_col() + 
  theme(axis.text.x= element_blank())
plt

###Mismo plot, pero ahora ordenado por latitud
Qval<-cbind(Latitud=samples_meta$LATITUDE, Qval)

#Transformar a formato largo
Qval_long<- gather(Qval, key=Kgroup, value=Qadmixture, 3:ncol(Qval))

#Ordenar niveles de la columna que ggplot2 usa en x para que estén en el orden deseado
Qval_long$INDIV<-factor(Qval_long$INDIV,
                        levels = Qval_long$INDIV[order(Qval$Latitud)])

##Plot
#Standar
plt<-ggplot(Qval_long, aes(x=INDIV, y=Qadmixture, fill=Kgroup)) + geom_col() + theme(axis.text.x = element_blank())
plt

