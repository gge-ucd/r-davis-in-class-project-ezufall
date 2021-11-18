

#theme_tufte()
#grid.arrange(plot1, plot2, ncol=2)
#color = as.factor(var) is categorical
#color = weight is a gradient
#scale_color_viridis_c(option = 'B')
#ggplot() + geom_sf(data = ca_counties, aes(fill = ALAND)) +
theme_map() + scale_fill_viridis_c()
library(ggplot2)
install.packages("BrailleR")
barplot <- ggplot(diamonds, aes(x = clarity, fill = cut)) +
   geom_bar() + theme(axis.text.x = element_text(angle = 70, vjust= 0.5))+
   scale_fill_viridis_d(option = "C")+theme_classic()
barplot

library(BrailleR)
BrailleR::VI(barplot)
#your title can give the TLDR of the graph findings
install.packages("sonify")
library(sonify)
data(iris)
plot(iris$Petal.Width)
sonify(x= iris$Index, y = iris$Petal.Width)

plot(x = iris$Petal.Length, y = iris$Petal.Width)
sonify(x= iris$Petal.Length, y = iris$Petal.Width)
#can you sonify two trendlines at the same time?
#timbre could be different for each trend line
#nope it doesn't work well with ggplot. we need to plot in hard vectors instead

#fill is filled in. color sometimes is just an outline
library(tidyverse)
diamonds.plot <-ggplot(diamonds, aes(clarity, fill = cut)) +
   geom_bar() + 
   theme(axis.text.x = element_text(angle = 45, vjust = 0.5))
diamonds.plot
mpg.plot <- ggplot(mpg, aes(cty, hwy, color = factor(cyl)))+
   geom_point(size = 2.5)
mpg.plot

iris.plot <- ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
   geom_point(alpha = 0.3)
iris.plot

install.packages("cowplot")
library(cowplot)

plot_grid(diamonds.plot, iris.plot, mpg.plot, labels = c("A","B","C"), nrow = 1)
finalplot <- ggdraw() + draw_plot(iris.plot, x = 0, y = 0, width = 1, height = 0.5) +
   draw_plot(mpg.plot, x = 0, y = 0.5, width = 0.5, height = 0.5) + 
   draw_plot(diamonds.plot, x = 0.5, y = 0.5, width = 0.5, height = 0.5)
#grid.arrange in gridextra package helps arrange plots
#patchwork also works
#ggsave saves the image
#getwd prints your working directory
getwd() 
#dir.create("figures")
ggsave("figures/finalplot.png", plot = finalplot, width = 6, height = 4, units = "in")
library(plotly)
#install.packages("plotly")
#this makes the image interactive
plotly::ggplotly(iris.plot)

#geom_sf = simple feature
#if you're using one data set include aesthetics in ggplot. otherwise 
#put aesthetics in the specific additions such as geom_boxplot

gapminder %>% filter(year %in% c(2002, 2007, 2012))
#is shorthand for
gapminder %>% filter(year == 2002|year==2007|year==2012)
#what I tried to do is
gapminder %>% filter(country == c("Nepal","Afghanistan"))
#but that doesn't work because the way it works is it tried to recycle the short (nepal, afghanistan)
#vector which then lost half of the nepals and afghanistans because it read as TFTFT for the 
#countries that are equal to Nepal and that are equal to Afghanistan

#on the week7 homework you might get a weird error message
#that's because col names that start with numbers act weirdly
#so you have to use mutate(popDiff = `2007`-`2002`)
#with the single quote found under the tilde
#because reqular quotes make it think that's just a string, it doesn't always know it's a column name
#non-numberic argument to binary operator means you're trying to do math with non-numbers


#for the homework assignment we need to drop Oceania
#tell it there are two id_cols = c(country,continent)

#regular expression search is also possible. eg "every col that starts with the letter y"

#we need to facet_wrap for the homework

#geom_bar(aes(x = country,y = popDiff),stat = "identity")
#next we do ordering
#that means the stat is what we input, and R is instructed not to calculate anything
#arrange makes it sort on population
#or you can use reorder within the aesthetic like:
#x = reorder(country,popDiff)
#we can rescale or let it float (let's let it flow, within facet_wrap, such as free_y)

