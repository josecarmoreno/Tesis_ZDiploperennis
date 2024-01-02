library(dplyr)

endogamia_Ja <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/endogamia/endogamiaJalisco.het", header = T)
Loc_Ja <- read.delim("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/endogamia/Localidades_Ja.txt", header = T)

fullendogamia_Ja <- cbind(endogamia_Ja, Loc_Ja)

# Calcular la endogamia promedio por localidad
endogamia_localidad <- aggregate(F ~ Localidad, data = fullendogamia_Ja , FUN = mean)

# Calcular la endogamia promedio de todo Jalisco
endogamia_jalisco <- mean(fullendogamia_Ja$F)

# Crear un data frame con los resultados
resultados <- rbind(endogamia_localidad, data.frame(Localidad = "Jalisco", F = endogamia_jalisco))

# Cargar la biblioteca ggplot2
library(ggplot2)

# Crear un gráfico de boxplots
ggplot(fullendogamia_Ja, aes(x = Localidad, y = F, fill = Localidad)) +
  geom_boxplot() +
  scale_fill_manual(values = c("Corralitos" = "#ebd14f", "Cuzalapa" = "#cc0067", "Playas" = "#c8827b", "Manantlan" = "#ff0110", "Jalisco" = "orange")) +
  labs(title = "Endogamia por Localidad en Jalisco",
       x = "Localidad", y = "Endogamia") +
  theme_minimal()

mean(fullendogamia_Ja, F)
