# Cargar los datos desde un archivo de texto plano. Jalisco
# Asegúrate de reemplazar 'tu_archivo.txt' con la ruta correcta a tu archivo de datos.
Ne_historicoCorralitos <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Corralitos/Output_Ne_Corralitos_data", header = TRUE, skip=1, nrows=200)
Ne_historicoCuzalapa <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Cuzalapa/Output_Ne_SanMiguelC_data", header = TRUE, skip=1, nrows=200)
Ne_historicoPlayas <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Playas/Output_Ne_Playas_data", header = TRUE, skip=1, nrows=200)
Ne_historicoManantlan <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Manantlán/Output_Ne_Manantlan_data", header = TRUE, skip=1, nrows=200)
Ne_historicoEmbocada <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Embocada/Output_Ne_Embocada_data", header = TRUE, skip=1, nrows=200)
Ne_historicoTateposco <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Tateposco/Output_Ne_Tateposco_data", header = TRUE, skip=1, nrows=200)
Ne_historicoElRincon <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/ElRincon/Output_Ne_ElRincon_data", header = TRUE, skip=1, nrows=200)
Ne_historicoAserradero <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Aserradero/Output_Ne_Aserradero_data", header = TRUE, skip=1, nrows=200)
Ne_historicoPino <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Pino/Output_Ne_Pino_data", header = TRUE, skip=1, nrows=200)
Ne_historicoZapotes <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/Localidades460SNP/Zapotes/Output_Ne_Zapotes_data", header = TRUE, skip=1, nrows=200)


###este script es para hacer una gráfica con la demografía histórica de todas las localidades eJaliscoMAF5/Output_Ne_diploperennis_dataJa
names(Ne_historicoZapotes)[names(Ne_historicoZapotes) == "Geometric_mean"] <- "mean_Zapotes"

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
