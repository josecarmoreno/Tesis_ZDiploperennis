###Cargar el archivo con la D de tajima de Jalisco 
DtajimaNa <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Nayarit500.Tajima.D", header = T)

head(DtajimaNa)
summary(DtajimaNa)
str(DtajimaNa)
names(DtajimaNa)

###Plot de la D de tajima por cromosoma
ggplot(DtajimaNa, aes(x = factor(CHROM), y = TajimaD)) +
  geom_boxplot(fill= "#3de330") +
  theme_light() +
  labs(title = "D de Tajima por cromosoma en Nayarit", x = "Cromosoma", y = "D de Tajima")

# Calcula el promedio por cromosoma
meancromosomaTajimaNa <- DtajimaNa %>%
  group_by(CHROM) %>%
  summarize(Promedio_TajimaDNa = mean(TajimaD, na.rm = TRUE))

# Muestra los resultados
print(meancromosomaTajimaNa)
