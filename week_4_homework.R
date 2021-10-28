library(tidyr)
library(dplyr)
surveys <- read_csv('data/portal_data_joined.csv')
#read_csv creates tibble
View(surveys)
#surveys[1,] is the first row
#surveys[,1] is the first col
#surveys[1] is the first col
summary(surveys)

#summary of max weight for each species and sex combination
weight_filtered_surveys <- surveys %>% filter(weight >=30 & weight <= 60)
print(head(weight_filtered_surveys,6))
biggest_critters <- weight_filtered_surveys %>% filter(!is.na(weight), !is.na(
   sex), !is.na(species)) %>% group_by(species, sex) %>% summarize(max_weight = 
                              max(weight)) %>% arrange(desc(max_weight))
View(biggest_critters)

colSums(is.na(surveys))#tally number of nas by column
tally(surveys, is.na(surveys))#overall number of nas
#tally is a wrapper for the n() function. you can't do anything else with it
#summarize(surveys,n())is also good that it has the count and statistics with it. tally is a dead end
#summarize(count = n(), mean = mean(weight, na.rm = T)) is another option for summ table
#sum(is.na(surveys$weight)) counts but doesn't let you compare
#adds avg weight of each species - sex combo to full survey tibble
surveys_avg_weight <- surveys %>% filter(!is.na(weight)) %>% group_by(species, sex
                        ) %>% mutate(mean_weight = mean(weight)) %>% select(
                           species, sex, weight, mean_weight)

#adds above_avg column with logical values stating whether > or < avg
surveys_avg_weight <- surveys_avg_weight %>% mutate(above_average = (weight>mean_weight))
                      