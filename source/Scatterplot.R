#Scatterplot comparing different IMDb ratings across streaming services
library(ggplot2)
scatter_all_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Tv_data_long.csv")

netflix_IMDb <- scatter_all_data %>% 
  filter(Platform == "Netflix") %>% 
  summarise(mean = mean(IMDb_new, na.rm = TRUE))

Disney_IMDb <- scatter_all_data %>% 
  filter(Platform == "Disney.") %>% 
  summarise(mean = mean(IMDb_new, na.rm = TRUE))

Prime.Video_IMDB <- scatter_all_data %>% 
  filter(Platform == "Prime.Video") %>% 
  summarise(mean = mean(IMDb_new, na.rm = TRUE))

Hulu_IMDb <- scatter_all_data %>% 
  filter(Platform == "Hulu") %>% 
  summarise(mean = mean(IMDb_new, na.rm = TRUE))

Average_per_platform2 <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  IMDb_Score=c(netflix_IMDb$mean, Disney_IMDb$mean, Prime.Video_IMDB$mean, Hulu_IMDb$mean)
)


scatter_for_imdb <- ggplot(Average_per_platform2, aes(x=Platform, y=IMDb_Score))+
  geom_point(stat = "identity")+
  ggtitle("IMDb Score By Service")
interactive_scatter <- ggplotly(scatter_for_imdb)
#-----------------------------------------------------------------------------#
#code for Movie data frame which isused for scatter plot

scatter_movie_data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-5-section-ag/main/data/Movie_data_long.csv")

#instead of using IMDb for scatter plot, the movies scatter plot will use Rotten Tomatoes(RT)
netflix_RT <- scatter_movie_data %>% 
  filter(Platform == "Netflix") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new, na.rm = TRUE))

Disney_RT <- scatter_movie_data %>% 
  filter(Platform == "Disney.") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new, na.rm = TRUE))

Prime.Video_RT <- scatter_movie_data %>% 
  filter(Platform == "Prime.Video") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new, na.rm = TRUE))

Hulu_RT <- scatter_movie_data %>% 
  filter(Platform == "Hulu") %>% 
  summarise(mean = mean(Rotten_Tomatoes_new, na.rm = TRUE))

Average_per_service <- data.frame(
  Platform=c("Netflix", "Disney.", "Prime.Video", "Hulu") , 
  Rotten_tomatoe_score=c(netflix_RT$mean, Disney_RT$mean, Prime.Video_RT$mean, Hulu_RT$mean)
)


scatter_for_RT <- ggplot(Average_per_service, aes(x=Platform, y=Rotten_tomatoe_score))+
  geom_point(stat = "identity")+
  ggtitle("Rotten Tomatoe Rating By Service")

interactive_scatter_movies <- ggplotly(scatter_for_RT)

#This graph shows us the average IMBd score across every show offered by the 4 main streaming platforms. We choose to do this because
#there are so many different platforms out there and we wanted to find a way to depict which one is the best. As you can see from this graph, 
#IMDb thinks that on average, Prime.Video has the highest quality shows on its platform. We choose to do a scatterplot because it makes it easy 
#to compare the differences between platforms.