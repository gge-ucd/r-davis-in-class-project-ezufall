

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
