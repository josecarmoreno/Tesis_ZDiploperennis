# Cargar el paquete adegenet
library(adegenet)

# Definir la ruta completa al archivo Fstat
fstat_file <- "/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataNa.dat"

# Leer el archivo Fstat
dapc_dataNa <- read.fstat(fstat_file)

# Proporcionar información de población o grupo (reemplaza "pop_vectorJa" con tus datos)
pop_vectorNa <- c("SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_La_Embocada_Arroyo_San_Andrés", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_Tateposco_Arroyo_La_Mesa", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "SA_Milpillas_El_Rincón_Arroyo_Charco_Verde", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Camino_al_Aserradero", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Potrero_El_Pino", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes", "San_Andrés_Milpillas_Los_Zapotes" )# Ejemplo, reemplaza con tus poblaciones
pop_vectorNa <- as.factor(pop_vectorNa)

# Asignar la información de población a las muestras
dapc_dataNa$pop <- pop_vectorNa

#25 PC y 6 clusters
grp <- find.clusters(dapc_dataJa, max.n.clust = 7)

# Calcular y mostrar el puntaje de a-scores para la selección de discriminantes
a_scores <- optim.a.score(dapc_resultNa)

# Realizar un análisis DAPC con información de población (7 Pc y 5 discriminantes)
dapc_resultNa <- dapc(dapc_dataNa)

# Definir los colores para cada grupo/clúster en formato hexadecimal
colors_hexNa <- c("#65cbcc", "#cc9ce5", "#247600", "#006a59", "#003366", "#680060")

# Visualizar los resultados del DAPC con colores asignados
scatter(dapc_resultNa, scree.pca = FALSE, pch = 16, col = colors_hexNa)

# Visualizar los resultados del DAPC
scatter(dapc_resultNa)
