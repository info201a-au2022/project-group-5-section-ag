#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
library(tidyverse)
library(shiny)
library(ggplot2)
library(plotly)

#Creating server to render interactive plots 
shinyServer(function(input, output) {

  
  output$bargraphs_content <- renderPlotly({
    final_bargraph <- final_bargraph_data %>% 
      pivot_longer(Movies:Shows, names_to = "Content", values_to = "Number") %>% 
      ggplot(aes(Platform, Number, fill = Content)) +
      geom_col(position = "dodge")
final_bargraph
    })

  output$piechart_movies <- renderPlot({
    num_of_movies <- ggplot(Count_per_platform_movie, aes(x="", y=Number_Of_movies, fill=Platform))+
      geom_bar(stat = "identity")+
      coord_polar("y", start=0)+
      ggtitle("Number Of movies Per Platform")
    num_of_movies
  })

  
  output$scatter_movies <- renderPlot({
    scatter_for_RT <- ggplot(Average_per_service, aes(x=Platform, y=Rotten_tomatoe_score))+
      geom_point(stat = "identity")+
      ggtitle("Rotten Tomatoe Rating By Service")
    scatter_for_RT
  })
  
#--------------------------------------------------------------------#
#Now doing outputs for TV Shows.

  
  output$scatter_tv <- renderPlotly({
    scatter_for_shows <- 
        ggplot(data = tv_data_long) + 
          geom_point(mapping = aes(x = IMDb_new , y = Rotten_Tomatoes_new , color = Platform, Title= Title)) + 
          labs(title = "TV Show ratings by platforms") +
          labs(y = "Rotten Tomatoes Rating" , x= "IMDb rating") 
    scatter_for_shows
  })
  #Dont worry about this right now ill figure out the wdigets
  output$plotname <- renderPlot({
    input$select
  })
#-------------------------------------------------------#
  #summary table based on Platform

<<<<<<< HEAD
=======

  
  
  
  
>>>>>>> 1de97f2b21714bbe80ae0eca716a83c93bc420c4
  
})
