###Vamos a hacer un plot para el Ne histórico de cada localidad
##Corralitos
ggplot(Jalisco_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Corralitos, color = "Corralitos")) +
  labs(color = "Localidad") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Corralitos" = "#ebd14f"
  )) +
  ggtitle("Tamaño efectivo histórico de Corralitos") +
  theme_light() 

##Cuzalapa
ggplot(Jalisco_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Cuzalapa, color = "Cuzalapa")) +
  labs(color = "Localidad") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Cuzalapa" = "#cc0077"
  )) +
  ggtitle("Tamaño efectivo histórico de Cuzalapa") +
  theme_light() 

##Playas
ggplot(Jalisco_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Playas, color = "Playas")) +
  labs(color = "Localidad") +
  scale_y_continuous(labels = scales::number_format()) +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Playas" = "#c8827b"
  )) +
  ggtitle("Tamaño efectivo histórico de Playas") +
  theme_light() 

##Manantlán
ggplot(Jalisco_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Manantlan, color = "Manantlan")) +
  labs(color = "Localidad") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Manantlan" = "#ff0110"
  )) +
  ggtitle("Tamaño efectivo histórico de Manantlan") +
  theme_light() 

##Embocada
ggplot(Nayarit_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Embocada, color = "Embocada")) +
  labs(color = "Localidad") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Embocada" = "#cc9ce5"
  )) +
  ggtitle("Tamaño efectivo histórico de Embocada") +
  theme_light() 

##Tateposco
ggplot(Nayarit_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Tateposco, color = "Tateposco")) +
  labs(color = "Localidad") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Tateposco" = "#247600"
  )) +
  ggtitle("Tamaño efectivo histórico de Tateposco") +
  theme_light() 

##ElRincon
ggplot(Nayarit_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_ElRincon, color = "ElRincon")) +
  labs(color = "Localidad") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "ElRincon" = "#65cbcc"
  )) +
  ggtitle("Tamaño efectivo histórico de El Rincón") +
  theme_light() 

##Aserradero
ggplot(Nayarit_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Aserradero, color = "Aserradero")) +
  labs(color = "Localidad") +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Aserradero" = "#006a59"
  )) +
  ggtitle("Tamaño efectivo histórico de Aserradero") +
  theme_light() 

##Pino
ggplot(Nayarit_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Pino, color = "Pino")) +
  labs(color = "Localidad") +
  scale_y_continuous(labels = scales::number_format()) +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Pino" = "#680060"
  )) +
  ggtitle("Tamaño efectivo histórico de Pino") +
  theme_light() 

##Zapotes
ggplot(Nayarit_historico, aes(x = Generation)) +
  geom_line(aes(y = mean_Zapotes, color = "Zapotes")) +
  labs(color = "Localidad") +
  scale_y_continuous(labels = scales::number_format()) +
  xlab("Generaciones") +
  ylab("Tamaño efectivo") +
  scale_color_manual(values = c(
    "Zapotes" = "#003366"
  )) +
  ggtitle("Tamaño efectivo histórico de Zapotes") +
  theme_light() 
