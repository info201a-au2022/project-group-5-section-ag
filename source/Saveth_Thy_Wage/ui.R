#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#Notes from meeting

# Combine number of movies and tv shows onto one bar graph
# Scatterplot representing all tv shows and their rotten  
# Summary information page 

title <- tags$a(href='',
                'Diamonds Explorer', target="_blank")

?tags




#Creating UI for our project
ui <- fluidPage(theme = shinytheme("paper"),
  navbarPage("Saveth Thy Wage",
   tabPanel("Introduction",
    titlePanel("Introduction"
    ),
    mainPanel(img(src = 'image.jpg')),
  ),
    tabPanel("Amount of Content by Platform",
    titlePanel("Interactive Visualizations for Movies on Streaming Platforms"
     ),
      sidebarLayout(
        sidebarPanel("sidebar panel"        
        ),
          mainPanel(
            plotOutput("bargraphs_movies"),
            plotOutput("scatter_movies")
          ),
      ),
    ),
   tabPanel("TV Show Ratings",
     titlePanel("Interactive Visualization for TV Shows on Streaming Platforms",
     ),
      sidebarLayout(
        sidebarPanel(
          selectInput("select", label = h3("Select Streaming service"), 
                                 choices = list("Netflix" , "Hulu", "Amazon Prime",
                                                "Disney" ), 
                                 selected = "Netflix" )
                     ),
        mainPanel(
          plotlyOutput("scatter_tv")
        ),
      ),
   ),
   navbarMenu("Summary Information",
      tabPanel("Summary Information",    
          titlePanel("Summary Information on Streaming Platforms"
                       ),
            sidebarLayout(
              sidebarPanel(
                selectInput("select", label = h3("Select Streaming service"), 
                      choices = list("Netflix" , "Hulu", "Amazon Prime",
                                     "Disney" ), 
                      selected = "Netflix" ), 
              ),
                mainPanel("main panel"
                  
                ),
            ),
                      
              ),
      tabPanel("About the Authors")
   )
   )
  )

 
#Second Tab with information regarding TV shows and their graphs


