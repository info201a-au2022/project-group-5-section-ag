library(rsconnect)
library(shinythemes)
library(ggplot2)
library(plotly)

install.packages("rsconnect")

library("shiny")
source("ui.R")
source("server.R")




shinyApp(ui = ui, server = server)