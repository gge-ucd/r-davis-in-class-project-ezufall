surveys <- read.csv('data/portal_data_joined.csv')
#keep observations before 1995
pre1995 <- filter(surveys, year < 1995)
View(pre1995)
#keep only year sex weight
yearsexweight <- select(pre1995, year, sex, weight)
str(yearsexweight)
#altogether now
challenge <- filter(select(surveys, year, sex, weight), year <1995)

challenge2 <- surveys %>% select(year, sex, weight) %>% filter(year<1995)
View(challenge2)

View(surveys)
spec <- surveys %>% na.omit(hindfoot_length) %>% 
   mutate(hindfoot_half = (hindfoot_length / 2)) %>% 
   filter(hindfoot_half < 30) %>% select(species_id, hindfoot_half)
#or for filtering na, you can use filter(!is.na(hindfoot_length))   
View(spec)

specsum <- spec %>% group_by(species_id = as.factor(species_id)) %>% 
   summarize(mean = 2* mean(hindfoot_half), min = 2*min(hindfoot_half), max = 2*max(hindfoot_half))

#you can also summarize(hindfoot_half) in specific way
#mutate_if is also more complicated



View(specsum)
summarize(specsum, mean = 2*mean(hindfoot_half))
?tibble
