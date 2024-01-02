install.packages("pbkrtest")
install.packages("lme4")
install.packages("dunn.test")
library(dunn.test)

###Histograma de endogamia de localidades de Jalisco 
hist(fullendogamia_Na$F, main = "Histograma de Endogamias", xlab = "Endogamias")

###Prueba Shapiro-Wilk para ver si las endogamias de Jalisco son normales
shapiro.test(fullendogamia_Na$F)


# Prueba de Kruskall-Wallis
kruskal.test(F ~ Localidad, data = fullendogamia_Na)

# Prueba de Dunn
dunnNayarit <- dunn.test(fullendogamia_Na$F, fullendogamia_Na$Localidad, method = "bonferroni")


fullendogamia_Na$Estado <- "Nayarit"


####Jalisco
# Suponiendo que 'localidades' es un vector con las localidades únicas en tu data frame
localidadesENa <- unique(fullendogamia_Na$Localidad)

# Lista para almacenar los resultados de las pruebas
resultados_wilcoxonENa <- list()

# Comparaciones de cada localidad contra toda Jalisco
for (loc in localidadesENa) {
  # Subconjunto de datos para la localidad actual
  subset_data <- fullendogamia_Na[fullendogamia_Na$Localidad == loc, ]
  
  # Prueba de Wilcoxon para comparar con toda Jalisco
  wilcox_resultNa <- wilcox.test(subset_data$F, y = fullendogamia_Na$F, alternative = "two.sided")
  
  # Corrección de Bonferroni
  wilcox_resultNa$p.value <- wilcox_resultNa$p.value * 4
  
  # Almacena el resultado
  resultados_wilcoxonENa[[loc]] <- wilcox_resultNa
}

# Muestra los resultados
resultados_wilcoxonENa
