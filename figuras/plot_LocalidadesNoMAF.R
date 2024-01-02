# Cargar los datos desde un archivo de texto plano. Jalisco
# Asegúrate de reemplazar 'tu_archivo.txt' con la ruta correcta a tu archivo de datos.
Ne_historicoCorralitos <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Corralitos/Output_Ne_CorralitosNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoCuzalapa <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Cuzalapa/Output_Ne_CuzalapaNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoPlayas <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Playas/Output_Ne_PlayasNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoManantlan <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Manantlan/Output_Ne_ManantlanNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoEmbocada <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Embocada/Output_Ne_EmbocadaNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoTateposco <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Tateposco/Output_Ne_TateposcoNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoElRincon <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/ElRincon/Output_Ne_ElRinconNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoAserradero <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Aserradero/Output_Ne_AserraderoNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoPino <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Pino/Output_Ne_PinoNoMAF_data", header = TRUE, skip=1, nrows=200)
Ne_historicoZapotes <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/LocalidadesNoMAF/Zapotes/Output_Ne_ZapotesNoMAF_data", header = TRUE, skip=1, nrows=200)


###este script es para hacer una gráfica con la demografía histórica de todas las localidades eJaliscoMAF5/Output_Ne_diploperennis_dataJa
names(Ne_historicoZapotes)[names(Ne_historicoZapotes) == "Geometric_mean"] <- "mean_Zapotes"
names(Ne_historicoCorralitos)[names(Ne_historicoCorralitos) == "Geometric_mean"] <- "mean_Corralitos"
names(Ne_historicoCuzalapa)[names(Ne_historicoCuzalapa) == "Geometric_mean"] <- "mean_Cuzalapa"
names(Ne_historicoPlayas)[names(Ne_historicoPlayas) == "Geometric_mean"] <- "mean_Playas"
names(Ne_historicoManantlan)[names(Ne_historicoManantlan) == "Geometric_mean"] <- "mean_Manantlan"
names(Ne_historicoEmbocada)[names(Ne_historicoEmbocada) == "Geometric_mean"] <- "mean_Embocada"
names(Ne_historicoTateposco)[names(Ne_historicoTateposco) == "Geometric_mean"] <- "mean_Tateposco"
names(Ne_historicoElRincon)[names(Ne_historicoElRincon) == "Geometric_mean"] <- "mean_ElRincon"
names(Ne_historicoAserradero)[names(Ne_historicoAserradero) == "Geometric_mean"] <- "mean_Aserradero"
names(Ne_historicoPino)[names(Ne_historicoPino) == "Geometric_mean"] <- "mean_Pino"




##Crear lista de localidades de Jalisco
Ne_localidadesJa <- list(Ne_historicoCorralitos, Ne_historicoCuzalapa, Ne_historicoPlayas, Ne_historicoManantlan)
##Lista de localidades Nayarit
Ne_localidadesNa <- list(Ne_historicoEmbocada, Ne_historicoTateposco, Ne_historicoElRincon, Ne_historicoAserradero, Ne_historicoPino, Ne_historicoZapotes)


# Combinar los data frames en uno solo usando la columna Generation como referencia
Jalisco_historico <- Ne_localidadesJa[[1]]  # Tomar el primer data frame como base

# Iterar para agregar los demás data frames
for (i in 2:length(Ne_localidadesJa)) {
  Jalisco_historico <- merge(Jalisco_historico, Ne_localidadesJa[[i]], by = "Generation", all = TRUE)
}


#Nayarit 
Nayarit_historico <- Ne_localidadesNa[[1]]  # Tomar el primer data frame como base

# Iterar para agregar los demás data frames
for (i in 2:length(Ne_localidadesNa)) {
  Nayarit_historico <- merge(Nayarit_historico, Ne_localidadesNa[[i]], by = "Generation", all = TRUE)
}

###Plot de Jalisco
library(ggplot2)

ggplot(Jalisco_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Corralitos, color = "Corralitos")) +
  geom_line(aes(y = mean_Cuzalapa, color = "San Miguel Cuzalapa")) +
  geom_line(aes(y = mean_Playas, color = "Las Playas")) +
  geom_line(aes(y = mean_Manantlan, color = "Manantlán")) +
  labs(color = "Localidades") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Corralitos" = "#ebd14f",
    "San Miguel Cuzalapa" = "#cc0067",
    "Las Playas" = "#c8827b",
    "Manantlán" = "#ff0110"
  )) +
  ggtitle("Tamaño efectivo histórico de localidades de Jalisco") +
  theme_light() 


###Plot de Nayarit
ggplot(Nayarit_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Embocada, color = "Embocada")) +
  geom_line(aes(y = mean_Tateposco, color = "Tateposco")) +
  geom_line(aes(y = mean_ElRincon, color = "El Rincón")) +
  geom_line(aes(y = mean_Aserradero, color = "Aserradero")) +
  geom_line(aes(y = mean_Pino, color = "El Pino")) +
  geom_line(aes(y = mean_Zapotes, color = "Los Zapotes")) +
  labs(color = "Localidades") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Embocada" = "#cc9ce5",
    "Tateposco" = "#247600",
    "El Rincón" = "#65cbcc",
    "Aserradero" = "#006a59",
    "El Pino" = "#680060",
    "Los Zapotes" = "#003366"
  )) +
  ggtitle("Tamaño efectivo histórico de localidades de Nayarit") +
  theme_light() 


###Plot solo de localidades Cuzalapa y Corralitos porque tienen un orden de magnitud súper diferente
ggplot(Jalisco_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Corralitos, color = "Corralitos")) +
  geom_line(aes(y = mean_Cuzalapa, color = "San Miguel Cuzalapa")) +
  labs(color = "Localidades") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Corralitos" = "#ebd14f",
    "San Miguel Cuzalapa" = "#cc0067"
  )) +
  ggtitle("Tamaño efectivo histórico de localidades de Jalisco") +
  theme_light() 
