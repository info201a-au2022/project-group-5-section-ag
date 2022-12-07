
#Pie Chart comparing the average Tv rating given rotten tomato score across streaming services

pie_all_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")

#pie Graph comparing the average Movie rating given rotten tomato score across streaming services
pie_movie_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Movie_data_long.csv")




netflix_count_tv <- pie_all_data %>% 
  filter(Platform == "Netflix") %>%
  summarise(count = n())

Hulu_count_tv <- pie_all_data %>% 
  filter(Platform == "Hulu") %>%
  summarise(count = n())

Disney_count_tv <- pie_all_data %>% 
  filter(Platform == "Disney.") %>%
  summarise(count = n())

Prime.Video_count_tv <- pie_all_data %>% 
  filter(Platform == "Prime.Video") %>%
  summarise(count = n())

Count_per_platform_tv <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  Shows=c(netflix_count_tv$count, Disney_count_tv$count, Prime.Video_count_tv$count, Hulu_count_tv$count)
)

num_of_shows <- ggplot(Count_per_platform_tv, aes(x="", y=Number_Of_Shows, fill=Platform))+
  geom_bar(stat = "identity")+
  coord_polar("y", start=0)+
  ggtitle("Number Of Shows Per Platform")
#############################################################
# movie pie chart code

netflix_count_movie <- pie_movie_data %>% 
  filter(Platform == "Netflix") %>%
  summarise(count = n())

Hulu_count_movie <- pie_movie_data %>% 
  filter(Platform == "Hulu") %>%
  summarise(count = n())

Disney_count_movie <- pie_movie_data %>% 
  filter(Platform == "Disney.") %>%
  summarise(count = n())

Prime.Video_count_movie <- pie_movie_data %>% 
  filter(Platform == "Prime.Video") %>%
  summarise(count = n())

Count_per_platform_movie <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  Movies=c(netflix_count_movie$count, Disney_count_movie$count, Prime.Video_count_movie$count, Hulu_count_movie$count)
)

num_of_movies <- ggplot(Count_per_platform_movie, aes(x="", y=Movies, fill=Platform))+
  geom_bar(stat = "identity")+
  coord_polar("y", start=0)+
  ggtitle("Number Of movies Per Platform")

final_bargraph_data <- left_join(Count_per_platform_movie, Count_per_platform_tv)



final_bargraph <- final_bargraph_data %>% 
  pivot_longer(Movies:Shows, names_to = "Content", values_to = "Number") %>% 
  ggplot(aes(Platform, Number, fill = Content)) +
  geom_col(position = "dodge")

interactive_bargraph <- ggplotly(final_bargraph)

# recall_contribs %>%
#pivot_longer(opponents:supporters, names_to = "donator", values_to = "value") %>%
 # ggplot(aes(city, value, fill = donator)) +
 # geom_col(position = "dodge")


  ###########################################################
#This Pie Chart attempts to display the number of shows per streaming platform in a way that shows the significance of the difference.
#We choose a pie chart because it is easy to combine any two or more platforms just like it is easy to buy any two or more platforms.
#Through this chart you can see that Netflix has by far the most, the next two are close, and Disney has by far the least. With more time/ skill I am going
#to figure out how to get the actual number to be displayed on each section. 
  

