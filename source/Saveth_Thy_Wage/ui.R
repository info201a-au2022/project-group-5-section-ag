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
ui <- fluidPage(
  theme = shinytheme("paper"),
  navbarPage(
    "Saveth Thy Wage",
    tabPanel("Introduction",
             titlePanel(
               h1(
                 "Saveth Thy Wage",
                 align = "center",
                 h5(
                   "A recent development that has impacted many of us has been the increase in the number of streaming services. 
                   People are forced to choose between the many platforms available or bite the bullet and pay absurd amounts of 
                   money to subscribe to each individual platform.
                   Because most of us do not have the option to do the later, we decided to figure out which platform is the most 
                   worth purchasing. To do so we decided to answer three main questions:
                   1. Which streaming service has the most content (most number of shows and movies)? 2. Which platform has the highest 
                   rated TV shows? 3. Which platform has the highest rated movies? Throughout this website we explore these three 
                   questions in order to answer the most important question:
                   how can I saveth thy wage by cutting down on the number of services I subscribe to and still get the best content 
                   out there. While this might not seem like a major problem, it has the potential to save millions of people money 
                   all around the world. The thing that is super important to consider in order to contextualize the data found in this 
                   website is the prices of the various platforms. This will help you make your choices and interpret the data. Of the 
                   analyzed platforms Disney+ comes in at the cheapest for $8/ month followed by Hulu at $13/ month, Prime video at $15/ 
                   month, and Netflix at $20/ month.",
                 ),
               ),
               
               
             ),
             mainPanel(width = 9,
                       h1(
                         img(src = "image.jpg",
                             width = "500px" ,
                             height = "500px",
                             align = "right"
                         ),
                       ),
             ),
    ),
    
    tabPanel(
      "Amount of Content by Platform",
      titlePanel("Interactive Visualizations for Movies on Streaming Platforms"),
      sidebarLayout(
        sidebarPanel(
          "The first key in understanding the differences in streaming platforms is the pure number of content
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
        mainPanel(plotlyOutput("bargraphs_content"),),
      ),
    ),
    tabPanel(
      "TV Show Ratings",
      titlePanel("Interactive Visualization for TV Shows on Streaming Platforms",),
      sidebarLayout(
        sidebarPanel(
          selectInput(
            "scatter",
            label = h3("Select Streaming service"),
            choices = list("Netflix" , "Hulu", "Prime.Video",
                           "Disney."),
            selected = "Netflix"
          ),
        ),
        mainPanel(plotlyOutput("scatter_tv")),
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
                                                       "Disney."), 
                                        selected = "Netflix" ), 
                          ),
                          
                          mainPanel(tableOutput("summary"),
                                    h3(
                                      strong("Summary Takeaways"),
                                      h6(tags$ol(
                                        tags$li("Prime Video has the most pure content on its platform."), 
                                        tags$li("Prime Video has the oldest average year of content while Netflix has the newest."), 
                                        tags$li("Netflix has the highest average show rating while Hulu has the lowest average show rating."),
                                        tags$li("There is a large gap between the number of content offered on Netflix and Prime video vs Hulu and Disney+.")
                                        
                                      ),
                                      
                                      ),
                                    ),
                          ),
                        ),
                        
               ),
               
               tabPanel("Report Page",
                        titlePanel(strong("Report", align = "center"),),
                        mainPanel(h2(
                          "Code name : Saveth Thy Wage",
                          h4(
                            "Project name : Comparing Streaming Services Value",
                            h4(
                              "Authors: John Novak, Keyvyn Rogers, Dominick Hudson",
                              h5(
                                "Affiliation: Info-201 : Technical Foundations of Informatics - University of Washington",
                                h5("Date: Autumn 2022",
                                   h3(
                                     strong("Abstract"),
                                     tags$h6(
                                       "Our main goal is to compare the large number of streaming services available to consumers to 
                              show the advantages and disadvantages of each one. We want to do this because of the increasingly 
                              concentrated streaming market and rising costs associated with accessing these services. We will 
                              reach this goal by manipulating the various data on the services such as ratings, costs, number of 
                              shows, etc… to come up with a score that ranks each service as well as allowing you to easily compare 
                              the various factors.",
                                       h4("Keywords: Accessibility, Entertainment, Savings, Comparison"),
                                       h3(
                                         strong("Introdcution"),
                                         h6("We are going to take existing data on the various streaming services on the market 
                                  and create a data visualization that allows consumers to easily compare them and decide 
                                  which is best for them. Users will be able to sort by factors such as ratings, price, 
                                  number of shows etc… and put emphasis on the factors that are most important to them. 
                                  We are also going to create an overall “score” of each service that tells you which one 
                                  is most worth its price. With an increasing amount of available streaming services, this 
                                  allows consumers to save money by cutting the services that are not worth the price and 
                                  instead focusing on the services with the most value.",
                                            h3(
                                              strong("Problem Domain"),
                                              h6(strong("Project framing:"), "Our project is getting at comparing the different entertainment options 
                                   on the market and helping consumers make informed buying decisions. This is not a massive 
                                   problem with large implications but it will have interesting insights into something that 
                                   directly impacts a lot of people.", strong("Human Values:"),"Like mentioned above this is not something 
                                   that has a large effect on many people however it will get at the value of saving money. 
                                   It also gets at the value of access to information because consumers will have a greater 
                                   idea of what they are spending their money on.", strong("Indirect Stakeholders:"), "People indirectly 
                                   affected by this data are the actual streaming companies. These are large companies that 
                                   probably make money off of deceiving people so this data will help take power from the 
                                   companies and give it to the people.", strong("Direct Stakeholders:"),"The people directly using our 
                                   data will be people using streaming services. It will directly impact them because they 
                                   are going to be able to have better access to the data and therefore make more educated 
                                   buying decisions. Possible harms: There is not really any harm that could come out of this 
                                   data. The only possible harm would be certain companies losing business but that would be 
                                   because of their own doing and at the greater benefit of society.",strong("Benefits:"),"as stated a 
                                   couple times, the main benefits of this are just showing various aspects of different 
                                   services and allowing people to easily compare them in order to decide which one is best 
                                   for them. ",
                                                 h3(
                                                   strong("Research Questions"),
                                                   h6(tags$ul(
                                                     tags$li("What streaming service has the best overall value?"), 
                                                     tags$li("What is the similarity between streaming services?"), 
                                                     tags$li("What streaming service provides the best usability for consumers?")
                                                   ),
                                                   h3(
                                                     strong("The Dataset"),
                                                     h6("The dataset we choose is a breakdown of all movies and TV shows on four of the top entertainment 
                                    streaming platforms (Hulu, Netflix, Disney +, and Prime Video). The movies have been ranked based 
                                    on user reviews and critic reviews, allowing us to rank each platform's selection of movies and tv 
                                    shows from multiple different standpoints (average movie/Tv show rating, average rating per platform, 
                                    average tv show rating per platform, etc. Both the movie dataset and the tv dataset were created by 
                                    the same person (name in citations). The dataset can be very useful and can be used to answer many 
                                    different questions, most consumers who many choices have so these days on where to spend their money 
                                    when it comes to entertainment and television. The source is credited and the rating for some has been 
                                    verified to check for accuracy against what is shown. Below is a table with the amount of rows and columns 
                                    for our datasets",
                                                        h3(
                                                          strong("Findings"),
                                                          h6(strong("What streaming service has the best overall value:"), "The streaming service with the best overall data 
                                     appears to be Netflix. Netflix has the second most amount of movies provided in its service as well 
                                     as the highest of shows. Additionally, it has a high concentration of highly rated shows 
                                     with a higher average than Prime Video and Hulu and roughly the same as Disney+ (with 4x the amount of shows). 
                                     While these numbers show how much value the content has, to get the best overall value we also have to 
                                     add in the price of the platforms. Disney+ comes in at the cheapest for $8/ month followed by Hulu at 
                                     $13/ month, Prime video at $15/ month, and Netflix at $20/ month (although there’s different prices for 
                                     different bundles. I think this shows Netflix still has the best value  but Disney+ is a good option if you are looking for something cheaper (with the tradeoff 
                                     of having less content). Overall this shows that a lot of what has the best value depends on what you put 
                                     value in. Is it what has the most content? What has the best content? What is the cheapest? Our visualization 
                                     will help individuals figure out for themselves what is best for their needs.",
                                                             strong("What is the similarity between streaming services:"),"Overall there is a lot more similarity between the services 
                                     than initially thought. Hulu, Prime Video, and Netflix have roughly the same amount of shows while Prime Video and 
                                     Netflix have roughly the same amount of movies. The main outlier is Disney who has significantly less content in 
                                     both categories. In terms of ratings, while the mean and median are slightly off between platforms, all have eerily 
                                     similar distributions. This shows that every platform is going to have its star shows, a large concentration of good 
                                     to ok shows, and a number of bad shows.",  
                                                             strong("What streaming services provide the best usability:"), "When exploring our project we came to the realization that usability 
                                     would be hard to visualize and so we decided to instead input some statistics here that give further depth to the value 
                                     of the different services as well as trying to answer this research question. The first is just ratings of the services 
                                     by customers. According to U.S. News and Report, Netflix comes in at the highest rating followed by Disney+, Prime Video, 
                                     and lastly Hulu. We then also wanted to highlight again the amount of content provided by each platform because that plays 
                                     a major role in usability. Prime Video has the most content followed closely by Netflix than Hulu and Disney+.", 
                                                             h3(
                                                               strong("Discussion"),
                                                               h6("The implications of this surround the answer to the second question: what is the similarity between platforms? Our 
                                     visualizations show that there is a lot of similarity between the different platforms. Number of shows, ratings of content, 
                                     etc… The implications of this similarity is that individuals can make the choice to only have one of these platforms. These 
                                     days it is so normalized to have subscriptions to every platform out there. That is a lot of money that adds up really fast. 
                                     Because of the similarities between platforms it should be ok to just choose one platform that meets your needs best and stick 
                                     with it. There are really good shows on every platform and thus you should not have to worry about missing out on anything 
                                     if you use these visualizations correctly. This gets at the greater importance of people using their money wisely which is 
                                     something that has gotten increasingly rare in todays society. The next big takeaway is that there is not clear choice for 
                                     everyone and that the different platforms have different positioning statements that create value in different ways for 
                                     different demographics. You can take away a lot of learning about business in general by examining this marketing mix. 
                                     There is always going to be a mix of products out there to fill a given need and before purchasing you have to do research 
                                     on what one is best for you. Specifically in the streaming industry there is no longer a single service that has a market 
                                     monopoly (which Netflix used to almost have) and while the increasing number of services is annoying to us in the short term, 
                                     the increase in company competition will probably benefit us in the long run. At the end of the day it is all of our choices 
                                     to make on what platform we use to watch on and no amount of numbers can take that away from us.",
                                                                  h3(
                                                                    strong("Conclusion"),
                                                                    h6("The biggest takeaway from this entire project is that the best value for a streaming platform depends on what 
                                      you are looking for in a platform. I did not realize how many ways that these platforms could be similar and yet fulfill 
                                      different needs at the same time. If you mainly watch movies and not tv shows you probably want to get either Netflix or 
                                      Prime Video. If you only watch shows you should choose Netflix because it has the most amount of shows and the 
                                      highest rated shows. If you are just looking for the cheapest option then you should choose Disney+. You can also break it 
                                      down by year through our scatterplot. This shows that Prime video has on average the oldest content and thus might be better 
                                      for older demographics. On the other end of the spectrum Netflix has the newest content. This might be better for anyone overall 
                                      who just wants to watch purely new shows or the specific young demographic that is more prone to trendy content. And at the 
                                      end of the day if there is a certain show that you really want to watch then you should get whatever platform that show is on. 
                                      The average person is only going to watch one show over a given period of time so it is sometimes more important to be able 
                                      to have the platform of the show that you most want to watch. This website can serve as a good tool to guide your search but 
                                      is not the end all be all. It is also important to note that you can always cancel your service and you do not have to keep 
                                      buying it every month/year. This is something that for some reason not a lot of people do but can be very helpful in letting 
                                      you watch every show that you want to through switching platforms by month/ year."
                                                                    ),
                                                                  ),   
                                                                  
                                                               ), 
                                                             ),
                                                             
                                                          ),
                                                        ),
                                                        
                                                     ),
                                                   ), 
                                                   ),
                                                 ),  
                                                 
                                              ),
                                            ),
                                         ),
                                       ),
                                       
                                     ),
                                   ),),
                              ),
                            ),
                            
                          ),
                        ),),)
    )
  )
)
