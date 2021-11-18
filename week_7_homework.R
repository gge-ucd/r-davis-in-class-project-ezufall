library(tidyverse)
library(plotly)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")
gapminderYear <- gapminder %>% pivot_wider(id_cols = c(country, continent), names_from = year, values_from = pop) %>% 
   mutate(popDiff = `2007`-`2002`) %>% filter(!(continent == "Oceania"))
barplot <- ggplot(gapminderYear, aes(fill = continent)) +
   theme_bw()+
   scale_fill_viridis_d(option = "C")+theme_classic() +
   labs(x = "Country", y = "Change in Population between 2002 and 2007", color = "Continent") + 
   geom_bar(aes(x = reorder(country,popDiff), y = popDiff), stat = "identity") + 
   theme(axis.text.x = element_text(angle = 45, vjust= 0.5, hjust = 1))+
   facet_wrap(vars(continent),scales = "free")

barplot



   
