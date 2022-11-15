#Summary Information Script
#Saveth Thy Wage
#11/14/2022
#Authors : John, Dominick, Keyvyn


#Dataset 1
movies_streaming <- read.csv(
"https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/MoviesOnStreamingPlatforms.csv") 

#Dataset 2
tv_shows <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")

View(movies_streaming)
View(tv_data_long)

#Creating list about Tv shows that reveals information

# Returning five different metrics from tv shows
library(dplyr)

#Simple Summary State for shows

Summary<- tv_data_long%>% group_by(Platform) %>% summarise(avg_RT = mean(Rotten_Tomatoes_new), avg_IMDB = mean(IMDb_new, na.rm = TRUE))
mean(a$Rotten_Tomatoes_new, na.rm= T)

#Number of shows per service
number_of_shows_Netflix <- tv_data_long %>%  
  filter(Platform == "Netflix") %>% 
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



family_friendly <- tv_shows %>% 
  mutate(across('Age',str_replace,'\\+',"")) %>% 
  group_by(Year , Age) %>% 
  summarise(avg_age_rating = mean(as.numeric(Age)),
            avg_year = mean(Year))

View(family_friendly)











View(shows_per_service)

#Average Rating Per Service IMDB


#Average Rating Per Service Rotten 



























