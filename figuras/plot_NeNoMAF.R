# Cargar la librería ggplot2
library(ggplot2)

# Cargar los datos desde un archivo de texto plano. Jalisco
# Asegúrate de reemplazar 'tu_archivo.txt' con la ruta correcta a tu archivo de datos.
Ne_historicoNoMAFJa <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/NeJaliscoNoMAF/Output_Ne_diploperennis_dataNoMAF_0Ja", header = TRUE, skip=1, nrows=200)

# Crear el gráfico de línea sin suavizado
ggplot(data = Ne_historicoNoMAFJa, aes(x = Generation, y = Geometric_mean)) +
  geom_line(color = "#ff7f00") + # Crear una línea
  labs(x = "Generación", y = "Tamaño efectivo promedio") + # Etiquetas de los ejes
  ggtitle("Tamaño efectivo histórico Jalisco") + # Título del gráfico
  theme_minimal() # Estilo del gráfico (puedes personalizarlo según tus preferencias)

# Cargar los datos desde un archivo de texto plano. Jalisco
# Asegúrate de reemplazar 'tu_archivo.txt' con la ruta correcta a tu archivo de datos.
Ne_historicoNoMAFNa <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados2/GONE/NeNayaritNoMAF/Output_Ne_diploperennis_dataNoMAF_0Na", header = TRUE, skip=1, nrows=200)

# Crear el gráfico de línea sin suavizado
ggplot(data = Ne_historicoNoMAFNa, aes(x = Generation, y = Geometric_mean)) +
  geom_line(color = "#3de330") + # Crear una línea
  labs(x = "Generación", y = "Tamaño efectivo promedio") + # Etiquetas de los ejes
  ggtitle("Tamaño efectivo histórico Nayarit") + # Título del gráfico
  theme_minimal() # Estilo del gráfico (puedes personalizarlo según tus preferencias)
