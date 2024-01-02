install.packages("pbkrtest")
install.packages("lme4")
install.packages("car")
library(car)

###Histograma de endogamia de localidades de Jalisco 
hist(fullendogamia_Ja$F, main = "Histograma de Endogamias", xlab = "Endogamias")

###Prueba Shapiro-Wilk para ver si las endogamias de Jalisco son normales
shapiro.test(fullendogamia_Ja$F)

###Prueba de Levene para evaluar homocedasticidad
car::leveneTest(F ~ Localidad, data = fullendogamia_Ja)
