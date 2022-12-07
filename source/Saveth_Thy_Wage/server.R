#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

library(shiny)
library(tidyr)
library(ggplot2)
library(dplyr)


#Creating server to render interactive plots 
shinyServer(function(input, output) {
<<<<<<< HEAD
  
=======

>>>>>>> 00723f055956c39d74c17029834165e738f8131e
  output$bargraphs_content <- renderPlotly({
    final_bargraph <- final_bargraph_data %>% 
      pivot_longer(Movies:Shows, names_to = "Content", values_to = "Number") %>% 
      ggplot(aes(Platform, Number, fill = Content)) +
      geom_col(position = "dodge")
    final_bargraph
  })
  
  #--------------------------------------------------------------------#
  #Now doing outputs for TV Shows.
  
  
  
  output$scatter_tv <- renderPlotly({
    scatter_for_shows <- 
      tv_data_long %>%
      filter(Platform == input$scatter) %>%
      ggplot() + 
      geom_point(mapping = aes(x = IMDb_new , y = Rotten_Tomatoes_new,color = Year, Title= Title)) + 
      labs(title = "TV Show ratings by platforms") +
      labs(y = "Rotten Tomatoes Rating" , x= "IMDb rating") 
    scatter_for_shows
  })
<<<<<<< HEAD
  
  output$summary <- renderTable({
    new_table <-
      summary_table %>% 
      filter(Platform == input$select)
    new_table
  })
  
})
=======
 
output$summary <- renderTable({
 new_table <-
   summary_table %>% 
   filter(Platform == input$select)
 new_table
})
  
})
>>>>>>> 00723f055956c39d74c17029834165e738f8131e
