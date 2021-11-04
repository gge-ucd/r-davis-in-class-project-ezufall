library(tidyverse)
library(scico)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")
View(gapminder)
lifeExpPlot <- gapminder %>% group_by(continent,year) %>% 
   summarize(mean_life_exp = mean(lifeExp)) %>% 
   ggplot(aes(year, mean_life_exp))+
   geom_point(mapping = aes(color = continent)) + 
   scale_colour_scico_d(alpha = 1, palette = "batlow") +
   labs(x = "year", y = "Mean Life Expectancy", title = "Life Expectancy over time", color = "Continent") + 
   theme_classic()
lifeExpPlot

#for point, color needs to be in the point aesthetic, not the plot aesthetic
#this code is a la carte, not using piping
#lifeExp.plot <-ggplot(gapminderLE, aes(year, mean_life_exp)) +
 #  geom_point(mapping = aes(color = continent)) + 
  # scale_colour_scico_d(alpha = 1, palette = "batlow") +
   #labs(x = "year", y = "Mean Life Expectancy", title = "Life Expectancy over time", color = "Continent") + 
   #theme_classic()
#lifeExp.plot

#adding pop-dependent circle size
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
   geom_point(aes(color = continent, alpha = 0.1), size = gapminder$pop/100000000) + 
   scale_x_log10() +
   geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
   theme_bw()
#geom_smooth creates a trend line

#create plot of life expectancy over five countries
gmPlot <- gapminder %>% filter(country == "Brazil" | country == "China" |
                                    country == "El Salvador" | country == "Niger" |
                                    country == "United States") %>% 
ggplot(aes(x= country, y = lifeExp)) + geom_boxplot(mapping=aes(color = country))+geom_jitter(alpha = 0.1) +
   labs(x = "Country", y = "Life Expectancy", title = "Life Expectancy of Five Countries") +
   theme_classic() +
   scale_colour_scico_d(alpha = 1, palette = "batlow")
gmPlot


