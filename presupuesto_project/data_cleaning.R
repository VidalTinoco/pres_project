#### data cleaning to filter michoacan state ####

### cargando librerias
library(dplyr)
library(tidyr)
library(tidyverse)
library(here)
library(readr)

### cargamos bases de datos

pef <- read_csv(here("data", "PEF_2023.csv"))
anexos <- read_csv(here("data", "Anexos_Transversales_PEF_2023.csv"))

### exploramos
summary(pef)
summary(anexos)

ncol(pef)
ncol(anexos)

### cambiamos variables a factores
pef <- pef %>% mutate(DESC_ENTIDAD_FEDERATIVA = factor(DESC_ENTIDAD_FEDERATIVA))

anexos <- anexos %>% mutate(ENTIDAD_FEDERATIVA = factor(ENTIDAD_FEDERATIVA))

### vemos como esta escrito mich
sort(unique(pef$DESC_ENTIDAD_FEDERATIVA)) # Michoac\xe1n

sort(unique(anexos$ENTIDAD_FEDERATIVA)) # Michoac\xe1n

### filtramos edo de interes (mich)
pef_mich <- pef %>% 
  filter(ID_ENTIDAD_FEDERATIVA == 16)

anexos_mich <- anexos %>% 
  filter(ID_ENTIDAD_FEDERATIVA == 16)

### descargamos csv
write_csv(pef_mich, "pef_mich.csv")
write_csv(anexos_mich, "anexos_mich.csv")

