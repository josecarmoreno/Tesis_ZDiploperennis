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
snpgdsBED2GDS("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataNa.bed",
              "/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataNa.fam",
              "/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataNa.bim",
              out.gdsfn="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataNa.gds",
              option=snpgdsOption(Z=20))

## Ver resumen de mis datos (esto no carga el archivo)
snpgdsSummary("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataNa.gds")

## Cargar archivo para trabajar en él 
genofile <- snpgdsOpen("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataNa.gds")

## Check snp.ids
head(read.gdsn(index.gdsn(genofile, "snp.id")))

## Check sample.ids
head(read.gdsn(index.gdsn(genofile, "sample.id")))

## Obtener nombres muestras de gdsn
sample.id <- read.gdsn(index.gdsn(genofile, "sample.id"))


## Cargar metadatos
fullmat <- read.delim(file="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/meta_Nayarit.txt")

# check
head(fullmat)
nrow(fullmat)
head(fullmat$INDIV) 
head(sample.id)


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
pop_code <- as.vector(fullmat$LUGAR)

## hacer pop_codes raza coincidan con samples
tab <- data.frame(sample.id = pca$sample.id,
                  pop = factor(pop_code)[match(pca$sample.id, sample.id)],
                  EV1 = pca$eigenvect[,1], 
                  EV2 = pca$eigenvect[,2],
                  stringsAsFactors = FALSE)
head(tab)

colorsNa <- c("SA_Milpillas_El_Rincón_Arroyo_Charco_Verde" = "#65cbcc", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés" = "#cc9ce5", "SA_Milpillas_Tateposco_Arroyo_La_Mesa" = "#247600", "San_Andrés_Milpillas_Camino_al_Aserradero" = "#006a59", "San_Andrés_Milpillas_Los_Zapotes" = "#003366", "San_Andrés_Milpillas_Potrero_El_Pino" = "#680060")

# plot
ggplot(data = tab, aes(x=EV1, y=EV2, colour=pop)) + geom_point() +
  scale_color_manual(values = colorsNa) +
  theme_light() +
  ylab(paste0("Componente principal 2 explica ", round(pc.percent, 2)[2], "%")) +
  xlab(paste0("Componente principal 1 explica ", round(pc.percent, 2)[1], "%")) +
  ggtitle("PCA Nayarit")

