
####Corralitos
###Cargar el archivo con la D de tajima de Jalisco 
DtajimaCorralitos <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Corralitos500.Tajima.D", header = T)

head(DtajimaCorralitos)
summary(DtajimaCorralitos)
str(DtajimaCorralitos)
names(DtajimaCorralitos)

###Plot de la D de tajima por cromosoma
ggplot(DtajimaCorralitos, aes(x = factor(CHROM), y = TajimaD)) +
  geom_boxplot() +
  labs(title = "Boxplot de Tajima's D por Cromosoma", x = "Cromosoma", y = "Tajima's D")

# Calcula el promedio por cromosoma
meancromosomaTajimaCorralitos <- DtajimaCorralitos %>%
  group_by(CHROM) %>%
  summarize(Promedio_TajimaDCorralitos = mean(TajimaD, na.rm = TRUE))

# Muestra los resultados
print(meancromosomaTajimaCorralitos)


####Cuzalapa
###Cargar el archivo con la D de tajima de Jalisco 
DtajimaCuzalapa <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Cuzalapa500.Tajima.D", header = T)

head(DtajimaCuzalapa)
summary(DtajimaCuzalapa)
str(DtajimaCuzalapa)
names(DtajimaCuzalapa)

###Plot de la D de tajima por cromosoma
ggplot(DtajimaCuzalapa, aes(x = factor(CHROM), y = TajimaD)) +
  geom_boxplot() +
  labs(title = "Boxplot de Tajima's D por Cromosoma", x = "Cromosoma", y = "Tajima's D")

# Calcula el promedio por cromosoma
meancromosomaTajimaCuzalapa <- DtajimaCuzalapa %>%
  group_by(CHROM) %>%
  summarize(Promedio_TajimaDCuzalapa = mean(TajimaD, na.rm = TRUE))

# Muestra los resultados
print(meancromosomaTajimaCuzalapa)


####Playas
###Cargar el archivo con la D de tajima de Jalisco 
DtajimaPlayas <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/Dtajima/bin500/Playas500.Tajima.D", header = T)

head(DtajimaPlayas)
summary(DtajimaPlayas)
str(DtajimaPlayas)
names(DtajimaPlayas)

###Plot de la D de tajima por cromosoma
ggplot(DtajimaPlayas, aes(x = factor(CHROM), y = TajimaD)) +
  geom_boxplot() +
  labs(title = "Boxplot de Tajima's D por Cromosoma", x = "Cromosoma", y = "Tajima's D")

# Calcula el promedio por cromosoma
meancromosomaTajimaPlayas <- DtajimaPlayas %>%
  group_by(CHROM) %>%
  summarize(Promedio_TajimaDPlayas = mean(TajimaD, na.rm = TRUE))

# Muestra los resultados
print(meancromosomaTajimaPlayas)


####
