# Segundo ensayo de PCA

### Yo no tuve que descargar SNPRelate ni gdsftm porque ya estaban en R

## cargar paquetes que voy a utilizar
library(gdsfmt)
library(SNPRelate)
library(ape)
library(ggplot2)


## cargar datos
### cargar datos en formato gds a partir de plink
#### yo usé rutas absolutas porque se me hizo menos confuso
snpgdsBED2GDS("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/bytaxa_diploperennis.bed",
"/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/bytaxa_diploperennis.fam",
"/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/bytaxa_diploperennis.bim",
out.gdsfn="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/bytaxa_diploperennis.gds",
option=snpgdsOption(Z=20))

## Ver resumen de mis datos (esto no carga el archivo)
snpgdsSummary("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/bytaxa_diploperennis.gds")

## Cargar archivo para trabajar en él 
genofile <- snpgdsOpen("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/bytaxa_diploperennis.gds")

## Check snp.ids
head(read.gdsn(index.gdsn(genofile, "snp.id")))

## Check sample.ids
head(read.gdsn(index.gdsn(genofile, "sample.id")))

## Obtener nombres muestras de gdsn
sample.id <- read.gdsn(index.gdsn(genofile, "sample.id"))


## Cargar metadatos
fullmat <- read.delim(file="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/data/datosZdiploperennis/PopMap_diploperennis.txt")

# check
head(fullmat)
nrow(fullmat)
head(fullmat$INDIV) 
head(sample.id)


## Alicia en su ejemplo carga los metadatos, pero yo no lo hice

# Realizar PCA
## PCA con maf>=0.95
pca <- snpgdsPCA(genofile, num.thread=2, maf=0.05)

# calcular el % de variación contenida por los primeros componentes
pc.percent <- pca$varprop*100
head(round(pc.percent, 2))
x <- round(pc.percent, 2)
sum(x[3:3])

# poner resultados en un plot con los puntos coloreados por categoría "raza"
## obtener info de raza 
pop_code <- as.vector(fullmat$Raza)

## hacer pop_codes raza coincidan con samples
tab <- data.frame(sample.id = pca$sample.id,
pop = factor(pop_code)[match(pca$sample.id, sample.id)],
EV1 = pca$eigenvect[,1], 
EV2 = pca$eigenvect[,2],
stringsAsFactors = FALSE)
head(tab)

# plot
ggplot(data = tab, aes(x=EV1, y=EV2, colour=pop)) + geom_point() +
ylab(paste0("eigenvector 2 explaining ", round(pc.percent, 2)[2], "%")) +
xlab(paste0("eigenvector 1 explaining ", round(pc.percent, 2)[1], "%"))




































