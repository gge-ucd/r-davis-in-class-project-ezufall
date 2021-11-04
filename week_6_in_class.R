#count is another way to get a summary table besides summarize

#use facet_wrap to create a grid of plots
#scales you can use "free_y" to free the x or y axis
#theme_bw function 
#install.packages("ggthemes")
#use themes, at least bw

library(ggplot2)

# --------------------------------------
# --------------------------------------
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

# EXPLORING the NA situation with conditional statements
## leaving the last "else" argument in case_when assigns the 'large' value to EVERYTHING else, including NAs

surveys %>%
   mutate(weight_cat = case_when(
      weight >= 20.00 ~ "small",
      weight > 20.00 & weight < 48.00 ~ "medium",
      T ~ "large"
   )) %>%
   select(weight, weight_cat) %>%
   filter(is.na(weight))


# leaving the last "else" argument in ifelse assigns the 'large' value to everything else, BUT DOES NOT INCLUDE NAs
surveys %>%
   mutate(weight_cat = ifelse(weight >= 20.00, "small",
                              ifelse(weight > 20.00 & weight < 48.00, "medium"
                                     ,"large"))) %>%
   select(weight, weight_cat) %>%
   filter(is.na(weight))

# specify the final argument in case_when()
surveys %>%
   mutate(weight_cat = case_when(
      weight >= 20.00 ~ "small",
      weight > 20.00 & weight < 48.00 ~ "medium",
      weight >= 48.00 ~ "large"
   )) %>%
   select(weight, weight_cat) %>%
   filter(is.na(weight))

# Manipulate surveys to create a new dataframe called surveys_wide with:
# 1. column for genus and a column named after every plot type (step 2)
# 2. each of these columns containing the mean hindfoot length of animals in that plot type and genus. So every row has a genus and then a mean hindfoot length value for every plot type. (step 1)
# 3. The dataframe should be sorted by values in the Control plot type column. (step 3)

# Step 1:
surveys2 <- surveys %>%
   filter(!is.na(hindfoot_length)) %>%
   group_by(plot_type, genus) %>%
   summarize(mean_hindfoot = mean(hindfoot_length))
surveys2

# Step 2 & 3:
surveys_wide <- pivot_wider(surveys2, names_from = "plot_type", values_from = "mean_hindfoot")
surveys_wide

# arrange
surveys_wide %>%
   arrange(Control)

surveys_wide %>%
   arrange(desc(Control))


# What if we wanted to reverse this back into the longer version of what we made before
?pivot_longer
surveys_reverse <- surveys_wide %>%
   pivot_longer(cols = c(Control:`Spectab exclosure`),
                names_to = "plot_type",
                values_to = "mean_hindfoot")
# cols:  which columns I want to pivot
# names_to: takes the column name and puts them into a column. What do you want to name the column of column names?
# values_to: takes the values from each of these columns cells. What do you want to name the column of cell values?

# Use what you just learned to create a scatter plot of weight and species_id with weight on the Y-axis, and species_id on the X-axis. Have the colors be coded by plot_type. Is this a good way to show this type of data? What might be a better graph

surveys_complete <- surveys %>%
   filter(complete.cases(.))

plot <- ggplot(data = surveys_complete, mapping = aes(y = weight, x = species_id)) +
   geom_point(alpha = 0.5, aes(color = plot_type))

# switches axes
ggplot(data = surveys_complete,
       mapping = aes(y = weight, x = plot_type)) +
   geom_point(alpha = 0.5, aes(color = species_id))

# plot types as panels
ggplot(surveys_complete, aes(x = species_id, y = weight)) +
   geom_point() +
   facet_wrap(~plot_type)

# don't like the theme
ggplot(surveys_complete, aes(x = species_id, y = weight)) +
   geom_point() +
   theme_classic()

#using jitter
ggplot(surveys_complete, aes(x = species_id, y = weight)) +
   geom_boxplot() +
   geom_jitter(mapping = aes(color = plot_type), alpha = 0.1)

#use violin instead of boxplot
ggplot(surveys_complete, aes(x = species_id, y = log10(weight))) +
   geom_violin(alpha = 0)

#try to use scale_y_log10()
ggplot(surveys_complete, aes(x = species_id, y = weight)) +
   geom_violin() + scale_y_log10()

surveys_subset <- surveys_complete %>% filter(!is.na(species_id), species_id == "PF"| species_id == "NL")
View(surveys_subset)
#exploring y=hindfoot_length for species PF and NL
ggplot(surveys_subset, aes(x = species_id, y = hindfoot_length)) +
   geom_jitter(mapping = aes(color = plot_type)) + geom_boxplot() 

#as factor
surveys_subset$plot_factor <- as.factor(surveys_subset$plot_id)
#exporing factor
ggplot(surveys_subset, aes(x = species_id, y = hindfoot_length)) +
   geom_jitter(alpha = 0.2, mapping = aes(color = plot_factor)) + geom_boxplot() 

#violin plot for same thing with batlow <3 <3 <3
ggplot(surveys_subset, aes(x = species_id, y = hindfoot_length)) +
   geom_point(position = position_jitterdodge(), mapping = aes(color = plot_type)) + geom_violin() + theme_solarized() +
   scale_colour_scico_d(alpha = 0.3, palette = "batlow")

 n = length(unique(surveys_subset$plot_type))

#exploring y=hindfoot_length for species PF and NL
ggplot(surveys_subset, aes(x = species_id, y = hindfoot_length)) +
   geom_jitter(mapping = aes(color = plot_type)) + geom_boxplot() +
#adding labels
   #color = legend
   #use tab complete for theme() to see how much stuff there is in there
labs(x = "Species ID", y = "Hindfoot Length", title = "Boxplot", color = "Plot ID") + 
   theme_classic()

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

