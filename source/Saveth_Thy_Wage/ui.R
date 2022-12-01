#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)

#Creating UI for our project
ui <- fluidPage(theme = shinytheme("cyborg"),
  navbarPage("Savethy Thy Wage",
   tabPanel("Movies",
    titlePanel("Interactive Visualizations for Movies on Streaming Platforms"
     )
    ),
   tabPanel("TV Shows",
     titlePanel("Interactive Visualizations for TV Shows on Streaming Platforms"
    )
   ),
   navbarMenu("About",
              tabPanel("Summary Information",
                       titlePanel("Summary Information on Streaming Platforms")
              ),
              tabPanel("The Authors")   
   )
   )
  )

 
#Second Tab with information regarding TV shows and their graphs

 
