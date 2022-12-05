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


library(plotly)
library(shiny)
library(ggplot2)
library(dplyr)
library(shinythemes)




#Creating UI for our project
ui <- fluidPage(theme = shinytheme("paper"),
  navbarPage("Saveth Thy Wage",
   tabPanel("Introduction",
    titlePanel(h1("Saveth Thy Wage", align ="center", h5("   A recent development that has impacted many of us has been the increase in the number of streaming services. People are forced to choose between the many platforms available or bite the bullet and pay absurd amounts of money to subscribe to each individual platform. 
                   Because most of us do not have the option to do the later, we decided to figure out which platform is the most worth purchasing. To do so we decided to answer three main questions:
                   1. Which streaming service has the most content (most number of shows and movies)? 2. Which platform has the highest rated TV shows? 3. Which platform has the highest rated movies? Throughout this website we explore these three questions in order to answer the most important question:
                   how can I saveth thy wage by cutting down on the number of services I subscribe to and still get the best content out there. While this might not seem like a major problem, it has the potential to save millions of people money all around the world.",
                                                        )),
               ),
    mainPanel(width = 9,
              h1(img(src = "image.jpg", width = "500px" , height = "500px", align = "right" )),
                ),
   ),
    tabPanel("Amount of Content by Platform",
    titlePanel("Interactive Visualizations for Movies on Streaming Platforms"
     ),
      sidebarLayout(
        sidebarPanel("The first key in understanding the differences in streaming platforms is the pure number of content 
                     available on each platform. If you want to choose a platform to buy you want to know that 
                     you are getting as much content as possible for your dollar. It also is important to see what 
                     has more when comparing movies and shows because you as an individual might be more interested in one 
                     of the two. When looking at the data it is interesting to see that there is a clear gap between the 
                     first two and the second two in terms of the number of movies. Netflix and Prime Video have roughly 4x as many 
                     movies as Disney and Hulu. This shows that if you mainly watch movies you should strongly consider Netflix and 
                     Prime video. When it comes to shows there is again a large gap between Disney and the rest of the platforms. 
                     Disney has only 351 shows in comparison to the other three that all sit around 2000. In total these stats would 
                     be the first thing to consider when looking at platforms to subscribe to."        
        ),
          mainPanel(
            plotlyOutput("bargraphs_content"),
          ),
      ),
    ),
   tabPanel("TV Show Ratings",
     titlePanel("Interactive Visualization for TV Shows on Streaming Platforms",
     ),
      sidebarLayout(
        sidebarPanel(
          selectInput("scatter", label = h3("Select Streaming service"), 
                                 choices = list("Netflix" , "Hulu", "Prime.Video",
                                                "Disney." ), 
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
                      choices = list("Netflix" , "Hulu", "Prime.Video",
                                     "Disney." ), 
                      selected = "Netflix" ), 
              ),
                mainPanel(tableOutput("summary")),
                  
                ),
            ),
             tabPanel("Report Page"
                      ),         
              ),

      tabPanel("Report Page"),

   )
   )
 

 
#Second Tab with information regarding TV shows and their graphs


