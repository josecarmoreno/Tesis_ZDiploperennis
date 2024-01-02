###Cargar el archivo con la D de tajima de Jalisco 
DtajimaJa <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Jalisco500.Tajima.D", header = T)

head(DtajimaJa)
summary(DtajimaJa)
str(DtajimaJa)
names(DtajimaJa)

###Plot de la D de tajima por cromosoma
ggplot(DtajimaJa, aes(x = factor(CHROM), y = TajimaD)) +
  geom_boxplot(fill = "#ff7f00") +
  theme_light() +
  labs(title = "D de Tajima por cromosoma en Jalisco", x = "Cromosoma", y = "D de Tajima")

# Calcula el promedio por cromosoma
meancromosomaTajimaJa <- DtajimaJa %>%
  group_by(CHROM) %>%
  summarize(Promedio_TajimaDJa = mean(TajimaD, na.rm = TRUE))

# Muestra los resultados
print(meancromosomaTajimaJa)


