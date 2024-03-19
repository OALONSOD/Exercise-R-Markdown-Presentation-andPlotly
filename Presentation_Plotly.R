# Librerias
library(dplyr)
library(ggplot2)
library(plotly)
library(readr)

# Cargar Datos
penguins <- read_csv("penguins.csv")

# Limpiar datos
penguins <- penguins %>%
  na.omit()

# Resumen de datos
summary(penguins)
penguins$species <- as.factor(penguins$species)
penguins$island <- as.factor(penguins$island)
penguins$sex <- as.factor(penguins$sex)
str(penguins)

# Graficar
plot_ly(penguins, x = ~island, y= ~body_mass_g, type = "box", color = ~factor(species)) %>% 
  layout(boxmode = "group") %>% 
  layout(title = "PENGUINS", xaxis = list(title = 'Island'), 
         yaxis = list(title = 'Body mass in g'), legend = list(title=list(text='Species of penguin')))
