# Cargar la librería ggplot2
library(ggplot2)

# Cargar los datos desde un archivo de texto plano. Jalisco
# Asegúrate de reemplazar 'tu_archivo.txt' con la ruta correcta a tu archivo de datos.
Ne_historicoJa <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/GONE/NeJaliscoMAF5/Output_Ne_diploperennis_dataJa", header = TRUE, skip=1, nrows=200)

# Crear el gráfico de línea sin suavizado
ggplot(data = Ne_historicoJa, aes(x = Generation, y = Geometric_mean)) +
  geom_line(color = "#ff7f00") + # Crear una línea
  labs(x = "Generación", y = "Tamaño efectivo promedio") + # Etiquetas de los ejes
  ggtitle("Tamaño efectivo histórico Jalisco") + # Título del gráfico
  theme_minimal() # Estilo del gráfico (puedes personalizarlo según tus preferencias)

# Cargar los datos desde un archivo de texto plano. Jalisco
# Asegúrate de reemplazar 'tu_archivo.txt' con la ruta correcta a tu archivo de datos.
Ne_historicoNa <- read.table("/home/genconser/Documentos/JoseCarlos/DiversidadZdiploperennis/R/resultados/GONE/NeNayaritMAF5/Output_Ne_diploperennis_dataNa", header = TRUE, skip=1, nrows=200)

# Crear el gráfico de línea sin suavizado
ggplot(data = Ne_historicoNa, aes(x = Generation, y = Geometric_mean)) +
  geom_line(color = "#3de330") + # Crear una línea
  labs(x = "Generación", y = "Tamaño efectivo promedio") + # Etiquetas de los ejes
  ggtitle("Tamaño efectivo histórico Nayarit") + # Título del gráfico
  theme_minimal() # Estilo del gráfico (puedes personalizarlo según tus preferencias)



