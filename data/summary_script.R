#Summary Information Script
#Saveth Thy Wage
#11/14/2022
#Authors : John, Dominick, Keyvyn


#Dataset 1
movies_streaming <- read.csv(
"https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/MoviesOnStreamingPlatforms.csv") 

#Dataset 2
tv_shows <- read.csv(
"https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/tv_shows.csv")

View(movies_streaming)
View(tv_shows)

#Creating list about Tv shows that reveals information

# Returning five different metrics from tv shows
library(dplyr)

#Simple Summary State for shows

summary_info <- list()
summary_info$num_observations <- nrow(tv_shows)

#Number of shows per service
number_of_shows_Netflix <- tv_shows %>%  
  filter(Netflix == 1) %>% 
  count(Netflix)

number_of_shows_Hulu <- tv_shows %>%  
  filter(Hulu == 1) %>% 
  count(Hulu)

number_of_shows_Disney <- tv_shows %>%  
  filter(Disney. == 1) %>% 
  count(Disney.)

number_of_shows_Amazon <- tv_shows %>%  
  filter(Prime.Video == 1) %>% 
  count(Prime.Video)

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



























