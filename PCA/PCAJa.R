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
snpgdsBED2GDS("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataJa.bed",
              "/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataJa.fam",
              "/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataJa.bim",
              out.gdsfn="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataJa.gds",
              option=snpgdsOption(Z=20))

## Ver resumen de mis datos (esto no carga el archivo)
snpgdsSummary("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataJa.gds")

## Cargar archivo para trabajar en él 
genofile <- snpgdsOpen("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataJa.gds")

## Check snp.ids
head(read.gdsn(index.gdsn(genofile, "snp.id")))

## Check sample.ids
head(read.gdsn(index.gdsn(genofile, "sample.id")))

## Obtener nombres muestras de gdsn
sample.id <- read.gdsn(index.gdsn(genofile, "sample.id"))


## Cargar metadatos
fullmat <- read.delim(file="/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/meta_Jalisco.txt")

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
sum(x[1:26])

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

colorsJa <- c("Corralitos" = "#ebd14f", "Las_Joyas_Las_Playas" = "#c8827b", "Manantlán" = "#ff0110", "San_Miguel_Cuzalapa" = "#cc0067")

# plot
ggplot(data = tab, aes(x=EV1, y=EV2, colour=pop)) + geom_point() +
  scale_color_manual(values = colorsJa) +
  theme_light() +
  ylab(paste0("Componente principal 2 explica ", round(pc.percent, 2)[2], "%")) +
  xlab(paste0("Componente principal 1 explica ", round(pc.percent, 2)[1], "%")) +
  ggtitle ("PCA Jalisco")

