#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

library(shiny)

#Creating server to render interactive plots 
shinyServer(function(input, output) {

  
  output$bargraphs_movies <- renderPlot({
   ggplot(Average_per_platform, aes(x=Platform, y=Rotten_Tomato_Score)) +
    geom_bar(stat = "identity") +
    ggtitle("Rotten Tomato Score By Service")

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
  output$piechart_tv <- renderPlot({
    piechart_shows <- ggplot(Count_per_platform_tv, aes(x="", y=Number_Of_Shows, fill=Platform))+
      geom_bar(stat = "identity")+
      coord_polar("y", start=0)+
      ggtitle("Number Of Shows Per Platform")
    piechart_shows
  })
  
  output$scatter_tv <- renderPlot({
    scatter_for_imdb <- ggplot(Average_per_platform2, aes(x=Platform, y=IMDb_Score))+
    geom_point(stat = "identity")+
    ggtitle("IMDb Score By Service")
    scatter_for_imdb
  })
  output$plotname <- renderPlot({
    input$select
  })

})
