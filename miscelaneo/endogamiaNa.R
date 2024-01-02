library(dplyr)

endogamia_Na <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/endogamia/endogamiaNayarit.het", header = T)
Loc_Na <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/endogamia/Localidades_Na.txt", header = T)

fullendogamia_Na <- cbind(endogamia_Na, Loc_Na)

# Calcular la endogamia promedio por localidad
endogamia_localidadNa <- aggregate(F ~ Localidad, data = fullendogamia_Na , FUN = mean)

# Calcular la endogamia promedio de todo Jalisco
endogamia_nayarit <- mean(fullendogamia_Na$F)

# Crear un data frame con los resultados
resultadosNa <- rbind(endogamia_localidadNa, data.frame(Localidad = "Nayarit", F = endogamia_nayarit))

# Cargar la biblioteca ggplot2
library(ggplot2)

# Crear un gráfico de boxplots
ggplot(fullendogamia_Na, aes(x = Localidad, y = F, fill = Localidad)) +
  geom_boxplot() +
  scale_fill_manual(values = c("Embocada" = "#cc9ce5", "Tateposco" = "#247600", "El_Rincon" = "#65cbcc", "Aserradero" = "#006a59", "Pino" = "#680060", "Zapotes" = "#003366")) +
  labs(title = "Endogamia por Localidad en Nayarit",
       x = "Localidad", y = "Endogamia") +
  theme_minimal()
