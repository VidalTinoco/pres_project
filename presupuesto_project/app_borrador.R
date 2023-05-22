##### Intentamos hacer un borrador de la app #####

### cargamos librerias
library(shiny)
library(ggplot2)
library(tidyverse)
library(tidyr)
library(dplyr)
library(readr)
library(readxl)
library(ggplot2)
library(here)

### cargando bases de datos
pres <- read_xlsx(here("data", "pres_egr_mich.xlsx"))

### limpiando para URs
data_ur <- pres %>% 
  group_by(factor(ur)) %>% 
  mutate(monto = sum(IMPORTE, na.rm = TRUE)) %>% 
  ungroup() %>% 
  select(ur, monto)

### Definiendo UI
ui <- fluidPage(
  titlePanel("Importes por UR"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("range", 
                  label = "Rango del Importe:",
                  min = 0, max = 7408666753, value = c(0, 7408666753))
    ),
    
    mainPanel(
      plotOutput("bar_plot")
    )
  )
)

### Definiendo Server
server <- function(input, output) {
  
  output$bar_plot <- renderPlot({
    ggplot(data_ur, aes(x = ur, y = monto)) +
      geom_col()
  })
  
}

# Run app ----
shinyApp(ui, server)