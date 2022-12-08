#Summary Information Script
#Saveth Thy Wage
#11/14/2022
#Authors : John, Dominick, Keyvyn

#########################################
#########################################
<<<<<<< HEAD
#Dataset 1
movies_streaming <- read.csv(
"https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/MoviesOnStreamingPlatforms.csv") 

#Dataset 2

tv_shows <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")
 #install.packages("devtools")
View(movies_streaming)
View(tv_shows)

library(dplyr)
library(ggplot2)
library(plotly)
#Dataset updated

tv_data_long <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")


#Creating list about Tv show data set that reveals information (summarize)

#Table Scrpit for Summary Information
# Table summerizing the data frame of tv shows. 

<<<<<<< HEAD
options(digits = 6)
summary_table <- tv_data_long %>%
  group_by(Platform) %>%
  summarise(Highest_Rated_RT = max(Rotten_Tomatoes_new),
            AVG_RT = mean(Rotten_Tomatoes_new, na.rm = TRUE),
            avg_IMDb = mean(IMDb_new, na.rm = TRUE),
            Highest_Rated_IMDb = max(IMDb_new, na.rm = TRUE),
            Lowest_IMDb = min(IMDb_new, na.rm = TRUE)
  )
View(summary_table)
<<<<<<< HEAD
=======
summary_table <- tv_data_long%>% 
  group_by(Platform) %>% 
  summarise(avg_Rotten_Tomato = mean(Rotten_Tomatoes_new), 
                                                 avg_IMDB = mean(IMDb_new, na.rm = TRUE), 
                                                 Highest_Rated_IMDb = max(IMDb_new,na.rm = TRUE),
                                                 Highest_Rated_RT = max(Rotten_Tomatoes_new,na.rm = TRUE),
                                                 Lowest_Rated_IMDb = min(IMDb_new,na.rm = TRUE),
                                                 Highest_Rated_RT = min(Rotten_Tomatoes_new, na.rm = TRUE),
                                                 Standard_Deviation_IMDb = sd(IMDb_new,na.rm = TRUE))


>>>>>>> 6a70e344bba60e837a8f4aadd94d685a2e91556f

max(tv_data_long$Rotten_Tomatoes_new)

test <- tv_data_long %>%
  group_by(Platform) %>%
  summarise(Highest_Rated_RT = max(Rotten_Tomatoes_new),
            AVG_RT = mean(Rotten_Tomatoes_new, na.rm = TRUE),
            Lowest_Rated_RT = min(Rotten_Tomatoes_new),
            avg_IMDb = mean(IMDb_new, na.rm = TRUE),
            Highest_Rated_IMDb = max(IMDb_new, na.rm = TRUE),
            Lowest_IMDb = min(IMDb_new, na.rm = TRUE)
            )
#------------------Netflix tv shows summary--------------------#
netflix_summary_table <- tv_shows %>% 
  filter(Platform == "Netflix") %>% 
  summarise(RT_mean = mean(Rotten_Tomatoes_new),
            IMDb_mean= mean(IMDb_new, na.rm = TRUE),
            Highest_Rated_IMDb = max(IMDb_new,na.rm = TRUE),
            Highest_Rated_RT = max(Rotten_Tomatoes_new,na.rm = TRUE),
            Lowest_Rated_IMDb = min(IMDb_new,na.rm = TRUE),
            Highest_Rated_RT = min(Rotten_Tomatoes_new, na.rm = TRUE),
            Lowest_Rated_RT = min(Rotten_Tomatoes_new,na.rm = TRUE),
            
            )

View(netflix_summary_table)
#---------------Hulu tv shows 

hulu_summary_table <- tv_shows %>% 
  filter(Platform == "Hulu") %>% 
  summarise(RT_mean = mean(Rotten_Tomatoes_new),
            IMDb_mean= mean(IMDb_new, na.rm = TRUE),
            Highest_Rated_IMDb = max(IMDb_new,na.rm = TRUE),
            Highest_Rated_RT = max(Rotten_Tomatoes_new,na.rm = TRUE),
            Lowest_Rated_IMDb = min(IMDb_new,na.rm = TRUE),
            Highest_Rated_RT = min(Rotten_Tomatoes_new, na.rm = TRUE),
            Lowest_Rated_RT = min(Rotten_Tomatoes_new,na.rm = TRUE),
            
  )

View(hulu_summary_table)


#----------------------------#
disney_summary_table <- tv_shows %>% 
  filter(Platform == "Disney.") %>% 
  summarise(RT_mean = mean(Rotten_Tomatoes_new),
            IMDb_mean= mean(IMDb_new, na.rm = TRUE),
            Highest_Rated_IMDb = max(IMDb_new,na.rm = TRUE),
            Highest_Rated_RT = max(Rotten_Tomatoes_new,na.rm = TRUE),
            Lowest_Rated_IMDb = min(IMDb_new,na.rm = TRUE),
            Highest_Rated_RT = min(Rotten_Tomatoes_new, na.rm = TRUE),
            Lowest_Rated_RT = min(Rotten_Tomatoes_new,na.rm = TRUE),
            
  )

View(disney_summary_table)
#-------------------------------#
prime_summary_table <- tv_shows %>% 
  filter(Platform == "Prime.Video") %>% 
  summarise(RT_mean = mean(Rotten_Tomatoes_new),
            IMDb_mean= mean(IMDb_new, na.rm = TRUE),
            Highest_Rated_IMDb = max(IMDb_new,na.rm = TRUE),
            Highest_Rated_RT = max(Rotten_Tomatoes_new,na.rm = TRUE),
            Lowest_Rated_IMDb = min(IMDb_new,na.rm = TRUE),
            Highest_Rated_RT = min(Rotten_Tomatoes_new, na.rm = TRUE),
            Lowest_Rated_RT = min(Rotten_Tomatoes_new,na.rm = TRUE),
            
  )

View(prime_summary_table)

#########################################
#########################################
#### Pie Chart graph##############
#### #This Pie Chart attempts to display the number of shows per streaming platform in a way that shows the significance of the difference.
#We choose a pie chart because it is easy to combine any two or more platforms just like it is easy to buy any two or more platforms.
#Through this chart you can see that Netflix has by far the most, the next two are close, and Disney has by far the least. With more time/ skill I am going
#to figure out how to get the actual number to be displayed on each section. 

netflix_count <- all_data %>% 
  filter(Platform == "Netflix") %>%
  summarise(count = n())

Hulu_count <- all_data %>% 
  filter(Platform == "Hulu") %>%
  summarise(count = n())

Disney._count <- all_data %>% 
  filter(Platform == "Disney.") %>%
  summarise(count = n())

Prime.Video_count <- all_data %>% 
  filter(Platform == "Prime.Video") %>%
  summarise(count = n())

Count_per_platform <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  Number_Of_Shows=c(netflix_count$count, Disney._count$count, Prime.Video_count$count, Hulu_count$count)
)

ggplot(Count_per_platform, aes(x="", y=Number_Of_Shows, fill=Platform))+
  geom_bar(stat = "identity")+
  coord_polar("y", start=0)+
  ggtitle("Number Of Shows Per Platform")

### Bar Graph############
#Bar Graph comparing the average rotten tomato score across streaming services

netflix_rotten_tomato <- all_data %>% 
  filter(Platform == "Netflix") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new))

Disney_rotten_tomato <- all_data %>% 
  filter(Platform == "Disney.") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new))

Prime.Video_rotten_tomato <- all_data %>% 
  filter(Platform == "Prime.Video") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new))

Hulu_rotten_tomato <- all_data %>% 
  filter(Platform == "Hulu") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new))

Average_per_platform <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  Rotten_Tomato_Score=c(netflix_rotten_tomato$mean, Disney_rotten_tomato$mean, Prime.Video_rotten_tomato$mean, Hulu_rotten_tomato$mean)
)

ggplot(Average_per_platform, aes(x=Platform, y=Rotten_Tomato_Score))+
  geom_bar(stat = "identity")+
  ggtitle("Rotten Tomato Score By Service")

# Data
Average_per_platform <- data.frame(x = c("Disney","Hulu","Netflix","Prime.Video"),
                 y = c(1:4))

# Barplot
cyber_bars(Average_per_platform, area = FALSE, bg.col = "black")

View(tv_data_long)

####### Scatter Plot######
#Scatterplot comparing different IMDb ratings across streaming services

netflix_IMDb <- all_data %>% 
  filter(Platform == "Netflix") %>% 
  summarise(mean = mean(IMDb_new, na.rm = TRUE))

Disney_IMDb <- all_data %>% 
  filter(Platform == "Disney.") %>% 
  summarise(mean = mean(IMDb_new, na.rm = TRUE))

Prime.Video_IMDB <- all_data %>% 
  filter(Platform == "Prime.Video") %>% 
  summarise(mean = mean(IMDb_new, na.rm = TRUE))

Hulu_IMDb <- all_data %>% 
  filter(Platform == "Hulu") %>% 
  summarise(mean = mean(IMDb_new, na.rm = TRUE))

Average_per_platform2 <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  IMDb_Score=c(netflix_IMDb$mean, Disney_IMDb$mean, Prime.Video_IMDB$mean, Hulu_IMDb$mean)
)


ggplot(Average_per_platform2, aes(x=Platform, y=IMDb_Score))+
  geom_point(stat = "identity")+
  ggtitle("IMDb Score By Service")

#This table gives a basic overview of different streaming platforms and their respective
# ratings from different sources. This also includes the highest and lowest rating each 
# platforms has for rotten tomatoes and IMDb when applicable.


##################################################
#Scatter plot for services and their respective shows
scatter_for_shows <- 
      ggplotly(
      ggplot(data = tv_data_long) + 
      geom_point(mapping = aes(x = IMDb_new , y = Rotten_Tomatoes_new , color = Platform)) + 
      labs(title = "TV Show ratings by platforms") +
      labs(y = "Rotten Tomatoes Rating" , x= "IMDb rating")) 

      
print(scatter_for_shows)


