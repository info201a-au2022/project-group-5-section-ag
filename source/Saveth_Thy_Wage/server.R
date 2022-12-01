#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(dplyr)
source("../source/BarGraph.R")
source("../source/Scatterplot.R")
source("../source/PieChart.R")


file.choose("BarGraph.R")




library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({
      
    })

})
