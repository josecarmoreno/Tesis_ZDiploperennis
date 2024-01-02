install.packages("pbkrtest")
install.packages("lme4")
install.packages("dunn.test")
library(dunn.test)

###Histograma de endogamia de localidades de Jalisco 
hist(fullendogamia_Ja$F, main = "Histograma de Endogamias", xlab = "Endogamias")

###Prueba Shapiro-Wilk para ver si las endogamias de Jalisco son normales
shapiro.test(fullendogamia_Ja$F)


# Prueba de Kruskall-Wallis
kruskal.test(F ~ Localidad, data = fullendogamia_Ja)

# Prueba de Dunn
dunnJalisco <- dunn.test(fullendogamia_Ja$F, fullendogamia_Ja$Localidad, method = "bonferroni")

fullendogamia_Ja$Estado <- "Jalisco"


####Jalisco
# Suponiendo que 'localidades' es un vector con las localidades únicas en tu data frame
localidadesEJa <- unique(fullendogamia_Ja$Localidad)

# Lista para almacenar los resultados de las pruebas
resultados_wilcoxonEJa <- list()

# Comparaciones de cada localidad contra toda Jalisco
for (loc in localidadesEJa) {
  # Subconjunto de datos para la localidad actual
  subset_data <- fullendogamia_Ja[fullendogamia_Ja$Localidad == loc, ]
  
  # Prueba de Wilcoxon para comparar con toda Jalisco
  wilcox_resultJa <- wilcox.test(subset_data$F, y = fullendogamia_Ja$F, alternative = "two.sided")
  
  # Corrección de Bonferroni
  wilcox_resultJa$p.value <- wilcox_resultJa$p.value * 4
  
  # Almacena el resultado
  resultados_wilcoxonEJa[[loc]] <- wilcox_resultJa
}

# Muestra los resultados
resultados_wilcoxonEJa
