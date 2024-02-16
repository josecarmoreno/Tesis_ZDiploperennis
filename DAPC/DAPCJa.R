# Cargar el paquete adegenet
library(adegenet)

# Definir la ruta completa al archivo Fstat
fstat_file <- "/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/data/datosZdiploperennis/datosJC/Populations/diploperennis_dataJa.dat"

# Leer el archivo Fstat
dapc_dataJa <- read.fstat(fstat_file)

# Proporcionar información de población o grupo (reemplaza "pop_vectorJa" con tus datos)
pop_vectorJa <- c("Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "Corralitos", "San_Miguel_Cuzalapa", "San_Miguel_Cuzalapa", "San_Miguel_Cuzalapa", "San_Miguel_Cuzalapa", "San_Miguel_Cuzalapa", "San_Miguel_Cuzalapa", "San_Miguel_Cuzalapa", "San_Miguel_Cuzalapa", "San_Miguel_Cuzalapa", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Las_Joyas_Las_Playas", "Manantlán", "Manantlán", "Manantlán", "Manantlán", "Manantlán", "Manantlán", "Manantlán", "Manantlán")  # Ejemplo, reemplaza con tus poblaciones
pop_vectorJa <- as.factor(pop_vectorJa)

# Asignar la información de población a las muestras
dapc_dataJa$pop <- pop_vectorJa

# 25 pc, 2 clusters
grp <- find.clusters(dapc_dataJa, max.n.clust = 6)

# Calcular y mostrar el puntaje de a-scores para la selección de discriminantes
a_scores <- optim.a.score(dapc_resultJa)

# Realizar un análisis DAPC con información de población 8 pc y 2 discriminantes
dapc_resultJa <- dapc(dapc_dataJa)

# Definir los colores para cada grupo/clúster en formato hexadecimal
colors_hexJa <- c("#ebd14f", "#c8827b", "#ff0110", "#cc0067")

# Visualizar los resultados del DAPC con colores asignados
scatter(dapc_resultJa, scree.pca = FALSE, pch = 16, col = colors_hexJa)


# Visualizar los resultados del DAPC
scatter(dapc_resultJa)
