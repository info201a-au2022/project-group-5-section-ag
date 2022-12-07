#Summary Information Script
#Saveth Thy Wage
#11/14/2022
#Authors : John, Dominick, Keyvyn

#########################################
#########################################
library(dplyr)
library(ggplot2)
library(plotly)
#Dataset updated

tv_data_long <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")


#Creating list about Tv show data set that reveals information (summarize)

#Table Scrpit for Summary Information
# Table summerizing the data frame of tv shows. 

summary_table <- tv_data_long%>% 
  group_by(Platform) %>% 
  summarise(avg_Rotten_Tomato = mean(Rotten_Tomatoes_new), 
                                                 avg_IMDB = mean(IMDb_new, na.rm = TRUE), 
                                                 Highest_Rated_IMDb = max(IMDb_new,na.rm = TRUE),
                                                 Highest_Rated_RT = max(Rotten_Tomatoes_new,na.rm = TRUE),
                                                 Lowest_Rated_IMDb = min(IMDb_new,na.rm = TRUE),
                                                 Highest_Rated_RT = min(Rotten_Tomatoes_new, na.rm = TRUE),
                                                 Standard_Deviation_IMDb = sd(IMDb_new,na.rm = TRUE))

##################################################
#Scatter plot for services and their respective shows
scatter_for_shows <- 
      ggplotly(
      ggplot(data = tv_data_long) + 
      geom_point(mapping = aes(x = IMDb_new , y = Rotten_Tomatoes_new , color = Platform)) + 
      labs(title = "TV Show ratings by platforms") +
      labs(y = "Rotten Tomatoes Rating" , x= "IMDb rating")) 

      
print(scatter_for_shows)


