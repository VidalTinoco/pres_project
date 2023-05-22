#### Exploracion de Datos ####

### Cargando librerias
library(tidyverse)
library(tidyr)
library(dplyr)
library(readr)
library(readxl)
library(ggplot2)
library(here)

### cargando bases de datos
pres <- read_xlsx(here("data", "pres_egr_mich.xlsx"))

### explorando
view(pres)
summary(pres)
pres$upp

### cambiamos variables a factores
summary(pres)

pres <- pres %>% mutate(upp = factor(upp),
                        ur = factor(ur),
                        `PROGRAMA PRESUPUESTARIO` = factor(`PROGRAMA PRESUPUESTARIO`),
                        CAPITULO = factor(CAPITULO),
                        PARTIDA = factor(PARTIDA),
                        `SUBPROGRAMA PRESUPUESTARIO` = factor(`SUBPROGRAMA PRESUPUESTARIO`))
pres

summary(pres)

### exploramos variables
unique(pres$ur)
class(pres$IMPORTE)
max(pres$IMPORTE)
