#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


#Creating UI for our project
ui <- fluidPage(theme = shinytheme("paper"),
  navbarPage("Saveth Thy Wage",
   tabPanel("Movies",
    titlePanel("Interactive Visualizations for Movies on Streaming Platforms"
     ),
      sidebarLayout(
        sidebarPanel("sidebar panel"        
        ),
          mainPanel(
            plotOutput("bargraphs_movies"),
            plotOutput("piechart_movies"),
            plotOutput("scatter_movies")
          ),
      ),
    ),
   tabPanel("TV Shows",
     titlePanel("Interactive Visualizations for TV Shows on Streaming Platforms",
     ),
      sidebarLayout(
        sidebarPanel("sidebar panel"
                     ),
        mainPanel(
          plotOutput("piechart_tv"),
          plotOutput("scatter_tv")
        ),
      ),
   ),
   navbarMenu("About",
      tabPanel("Summary Information",    
          titlePanel("Summary Information on Streaming Platforms"
                       ),
            sidebarLayout(
              sidebarPanel(
                selectInput("select", label = h3("Select Streaming service"), 
                      choices = list("Netflix" = 1, "Hulu" = 2, "Amazon Prime" = 3,
                                     "Disney" = 1), 
                      selected = 1), 
              ),
                mainPanel("main panel"
                  
                ),
            ),
                      
              ),
              tabPanel("The Authors")   
   )
   )
  )

 
#Second Tab with information regarding TV shows and their graphs


