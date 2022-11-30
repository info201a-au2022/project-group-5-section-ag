
#Pie Chart of number of shows per streaming service


pie_all_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")


?count

netflix_count <- pie_all_data %>% 
  filter(Platform == "Netflix") %>%
  summarise(count = n())

Hulu_count <- pie_all_data %>% 
  filter(Platform == "Hulu") %>%
  summarise(count = n())

Disney._count <- pie_all_data %>% 
  filter(Platform == "Disney.") %>%
  summarise(count = n())

Prime.Video_count <- pie_all_data %>% 
  filter(Platform == "Prime.Video") %>%
  summarise(count = n())

Count_per_platform <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  Number_Of_Shows=c(netflix_count$count, Disney._count$count, Prime.Video_count$count, Hulu_count$count)
)

num_of_shows <- ggplot(Count_per_platform, aes(x="", y=Number_Of_Shows, fill=Platform))+
  geom_bar(stat = "identity")+
  coord_polar("y", start=0)+
  ggtitle("Number Of Shows Per Platform")
  
  
#This Pie Chart attempts to display the number of shows per streaming platform in a way that shows the significance of the difference.
#We choose a pie chart because it is easy to combine any two or more platforms just like it is easy to buy any two or more platforms.
#Through this chart you can see that Netflix has by far the most, the next two are close, and Disney has by far the least. With more time/ skill I am going
#to figure out how to get the actual number to be displayed on each section. 
  
>>>>>>> fab0b16e8c4624164bdb860120025dfdadc71623
