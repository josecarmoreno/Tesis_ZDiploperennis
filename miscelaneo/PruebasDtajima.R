####Pruebas estadísticas de normalidad de la D de tajima de Jalisco
###Pruebas de normalidad
##Histogta,a
hist(DtajimaJa$TajimaD, main = "Histograma de D de Tajima")

##Q-Q Plot
qqnorm(DtajimaJa$TajimaD)
qqline(DtajimaJa$TajimaD)

##
shapiro.test(DtajimaJa$TajimaD)


####Pruebas estadísticas de normalidad para la D de tajima de Nayarit
###Pruebas de normalidad
##Histogta,a
hist(DtajimaNa$TajimaD, main = "Histograma de D de Tajima")

##Q-Q Plot
qqnorm(DtajimaNa$TajimaD)
qqline(DtajimaNa$TajimaD)

##
shapiro.test(DtajimaNa$TajimaD)

#####Mis datos no tienen una distribución norma, por lo que haré pruebas estadísticas no paramétricas para determinar
#####si las D de tajima de las localidades son significativamente distintas de 0

##Wilcox test Jalisco
Wilcox_DJalisco <- wilcox.test(DtajimaJa$TajimaD, mu = 0)

##Wilcox test Nayarit
Wilcox_DNayarit <- wilcox.test(DtajimaNa$TajimaD, mu = 0)

##Localidades
wilcox.test(DtajimaCorralitos$TajimaD, mu = 0)
wilcox.test(DtajimaCuzalapa$TajimaD, mu = 0)
wilcox.test(DtajimaPlayas$TajimaD, mu = 0)
wilcox.test(DtajimaManantlan$TajimaD, mu = 0)
wilcox.test(DtajimaEmbocada$TajimaD, mu = 0)
wilcox.test(DtajimaTateposco$TajimaD, mu = 0)
wilcox.test(DtajimaElRincon$TajimaD, mu = 0)
wilcox.test(DtajimaAserradero$TajimaD, mu = 0)
wilcox.test(DtajimaPino$TajimaD, mu = 0)
wilcox.test(DtajimaZapotes$TajimaD, mu = 0)

