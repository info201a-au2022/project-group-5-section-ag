
#Bar Graph comparing the average rotten tomato score across streaming services

bar_all_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")

library(ggplot2)

?summarise

netflix_rotten_tomato <- bar_all_data %>% 
  filter(Platform == "Netflix") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new))

Disney_rotten_tomato <- bar_all_data %>% 
  filter(Platform == "Disney.") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new))

Prime.Video_rotten_tomato <- bar_all_data %>% 
  filter(Platform == "Prime.Video") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new))

Hulu_rotten_tomato <- bar_all_data %>% 
  filter(Platform == "Hulu") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new))

Average_per_platform <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  Rotten_Tomato_Score=c(netflix_rotten_tomato$mean, Disney_rotten_tomato$mean, Prime.Video_rotten_tomato$mean, Hulu_rotten_tomato$mean)
)

?ggtitle


bar_graph_perf <- ggplot(Average_per_platform, aes(x=Platform, y=Rotten_Tomato_Score)) +
  geom_bar(stat = "identity") +
  ggtitle("Rotten Tomato Score By Service")


#This is a simple bar graph that shows the average rotten tomato score across every show offered through the four main streaming platforms.
#Rotten Tomato is one of the most reputable rating devices out there so it gives prospective key information into what streaming service
#is the most worth purchasing. This is especially important with rising costs and an increasing number of streaming platforms. 
#We choose a bar graph because it makes it super easy to distinguish the differences and it depicts that Rotten Tomatos thinks that Netflix has the best
#shows, albeit a close margin making it worth looking into other factors.
