#Summary Information Script
#Saveth Thy Wage
#11/14/2022
#Authors : John, Dominick, Keyvyn

#########################################
#########################################
#Dataset 1
movies_streaming <- read.csv(
"https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/MoviesOnStreamingPlatforms.csv") 

#Dataset 2
tv_shows <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")
 #install.packages("devtools")
devtools::install_github("R-CoderDotCom/cyberpunk")
View(movies_streaming)
View(tv_data_long)
library(dplyr)
library(ggplot2)
#Creating list about Tv show data set that reveals information (summarize)

# Returning five different metrics from tv shows
summary_info <- list(tv_data_long)
summarise(tv_data_long)
view (summary_info)
#Simple Summary State for shows

Summary<- tv_data_long%>% group_by(Platform) %>% summarise(avg_RT = mean(Rotten_Tomatoes_new), avg_IMDB = mean(IMDb_new, na.rm = TRUE))
view(Summary)

#Number of shows per service
number_of_shows_Netflix <- tv_data_long %>%  
  filter(Platform== "Netflix") %>% 
  count(Platform)

number_of_shows_Hulu <- tv_data_long %>%  
  filter(Platform=="Hulu" ) %>% 
  count(Platform)

number_of_shows_Disney <- tv_data_long %>%  
  filter(Platform == "Disney.") %>% 
  count(Platform)

number_of_shows_Amazon <- tv_data_long %>%  
  filter(Platform == "Prime.Video") %>% 
  count(Platform)

shows_per_service <- data.frame(name_of_streaming_service = c("Netflix","Hulu","Amazon","Disney"),
                                number_of_shows = c(1971,1621,1831,351))



#Table Scrpit for Summary Information
# Table summerizing the data frame of tv shows. 
tv_data_long%>% group_by(Platform) %>% summarise(avg_Rotten_Tomato = mean(Rotten_Tomatoes_new), 
                                                 avg_IMDB = mean(IMDb_new, na.rm = TRUE), 
                                                 Highest_Rated_IMDb = max(IMDb_new,na.rm = TRUE),
                                                 Highest_Rated_RT = max(Rotten_Tomatoes_new,na.rm = TRUE),
                                                 Lowest_Rated_IMDb = min(IMDb_new,na.rm = TRUE),
                                                 Highest_Rated_RT = min(Rotten_Tomatoes_new, na.rm = TRUE),
                                                 Standard_Deviation_IMDb = sd(IMDb_new,na.rm = TRUE))

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

<<<<<<< HEAD

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
#################################################
##################################################
=======
>>>>>>> 8ed381e869d6f74d8bb1edd2087662655a4b601a
family_friendly <- tv_shows %>% 
  mutate(across('Age',str_replace,'\\+',"")) %>% 
  group_by(Year , Age) %>% 
  summarise(avg_age_rating = mean(as.numeric(Age)),
            avg_year = mean(Year))












View(shows_per_service)

#Average Rating Per Service IMDB


#Average Rating Per Service Rotten 



























