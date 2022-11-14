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

number_of_shows_Netflix <- tv_shows %>%  
  count(Netflix)
print(number_of_shows_per_service)

number_of_shows_Hulu <- tv_shows %>%  
  count(Hulu)

number_of_shows_Disney <- tv_shows %>%  
  count(Disney.)

number_of_shows_Amazon <- tv_shows %>%  
  count(Prime.Video)

count_combo <- list(number_of_shows_Netflix, number_of_shows_Amazon,
                         number_of_shows_Disney, number_of_shows_Hulu)

View(count_combo)

