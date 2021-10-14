library(tidyverse)

surveys <- read.csv(file = 'data/portal_data_joined.csv')
surveys_base <- select(surveys, species_id, weight, plot_type)
#or surveys_base <- surveys[c('species_id', 'weight','plot_type')]
surveys_base <- surveys_base[1:60,]
#or surveys_base <- head(x = surveys_base,60)
#or to combine these two lines of code:
#surveys_base <- surveys[c(1:60),c(6,9,13)] or you can call them by name

surveys_base$species_id <- as_factor(surveys_base$species_id)
surveys_base$plot_type <- as_factor(surveys_base$plot_type)
class(surveys_base$species_id)

#a factor is grouped into different categories or levels. It is an organized system rather than just a group of different things.
View(surveys_base)
#no_na_surveys_base <- na.omit(surveys_base) #assumes only NAs are weight
#instead try
no_na_surveys_base <- surveys_base %>% na.omit(surveys_base$weight)
#or na.omit(surveys_base, surveys_base$weight)
View(no_na_surveys_base)
#or surveys_base[is.ne(surveys_base$weight),]
#or surveys_base[!is.na(surveys_base$weight),]

challenge_base <- filter(no_na_surveys_base, weight >= 150)
View(challenge_base)

#View(surveys)
#head(surveys, 20)
#str(surveys)
#?class
#class(surveys)
#?read.csv
#getwd()
#summary(surveys)
#length(unique(surveys$species_id))
#surveys[400,2]#row, column
#library(tidyverse)
#library(stats)
#install.packages("conflicted")
#dplyr::filter(surveys)
#filter <- dplyr::filter
#filter(surveys)
#levels(factor(surveys$species))
#factor(surveys$species)
#surveys_200 <- surveys[200,]
#surveys_last <- surveys[length(surveys),]
#View(surveys_last)
#surveys_middle <- surveys[nrow(surveys)/2,]
#View(surveys[7:nrow(surveys),])

#duplicate head
surveys_head <- surveys[-(7:nrow(surveys)),]
surveys_head
