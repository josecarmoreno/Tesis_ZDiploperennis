library(ggplot2)
library(tidyr)
library(dplyr)
library(readr)

###Estimar el valor óptimo de K
#leer el K error
k.error<- read.delim("C:/Users/RYZEN 5/Documents/Para_microsoft/Resultados/Admixture/admixtureJa/admixtureJa/zdiploperennisJa_Kerror.txt", header = F, sep = ":")
rownames(k.error)<- c("k=1", "k=2", "k=3", "k=4", "k=5")

#Hacer el plot para el K error
e.plot<- ggplot(data=k.error, aes(x=1:5, y=V2)) + geom_point() + geom_line()
e.plot + xlab("k") + ylab("Error") +  ggtitle("Prueba de error cruzado de Jalisco") + theme_light()

###Hacer el plot para K=4

##Obtener metadatos
samples_meta<-read.delim("C:/Users/RYZEN 5/Documents/Para_microsoft/metadata/meta_Jalisco.txt", 
                         header=TRUE, sep="\t")

samples_names<-read.delim("C:/Users/RYZEN 5/Documents/Para_microsoft/data/diploperennis_dataJa.fam", header=FALSE, sep=" ") %>%
  select(., V2) %>%
  rename(., INDIV=V2)

#leer el archivo Q 
Qval<-read.table(paste0("C:/Users/RYZEN 5/Documents/Para_microsoft/Resultados/Admixture/admixtureJa/admixtureJa/diploperennis_dataJa.4.Q"))
names(Qval)<-paste0("K", 1:ncol(Qval))

#Formato del archivo Q para plotting
#añadir nombres de muestras a la Qtable
Qval<-cbind(INDIV=samples_names$INDIV, Qval)

#transformar a formato largo
Qval_long <- Qval %>%
  pivot_longer(cols = starts_with("K"), names_to = "Kgroup", values_to = "Qadmixture")

##Plot
plt<-ggplot(Qval_long, aes(x=INDIV, y=Qadmixture, fill=Kgroup)) + geom_col() + 
#standar
  theme(axis.text.x= element_blank())
plt

###Mismo plot, pero ahora ordenado por latitud
Qval<-cbind(Latitud=samples_meta$LATITUDE, Qval)

#Transformar a formato largo
Qval_long<- gather(Qval, key=Kgroup, value=Qadmixture, 3:ncol(Qval))


# Ordenar por latitud
Qval_long <- Qval_long[order(Qval_long$Latitud), ]

# Crear factores
Qval_long$INDIV <- factor(Qval_long$INDIV, levels = unique(Qval_long$INDIV))


##Plot
#Standar
plt<-ggplot(Qval_long, aes(x=INDIV, y=Qadmixture, fill=Kgroup)) + geom_col() + theme(axis.text.x = element_blank())
plt

