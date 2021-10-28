

library(tidyverse)
surveys = read_csv("data/portal_data_joined.csv")
View(surveys)

#adds avg hindfoot length of each genus-plot-type combo to full survey tibble and summarizes
surveys_avg_hindfoot <- surveys %>% filter(!is.na(hindfoot_length)) %>% group_by(genus, plot_type
) %>% summarize(mean_hindfoot = mean(hindfoot_length))
View(surveys_avg_hindfoot)
surveys_wide <- pivot_wider(surveys_avg_hindfoot, names_from = "plot_type", 
                            id_cols = "genus", values_from = "mean_hindfoot") %>% arrange(Control)
#use pivot_wider on surveys with plot_type as cols, genus as rows, and mean hindfoot as vals
View(surveys_wide)

#question 2 of homework. See bonus for question 3 coded on the iris problem.
surveys_arr <- surveys %>% filter(!is.na(weight)) %>% arrange(weight)
View(surveys_arr)
surveys_weight_size <- mutate(surveys_arr, weight_cat = ifelse(weight <= pull(surveys_arr[floor((nrow(surveys_arr)+1)/4),"weight"]), "small",
                                                               (ifelse(weight >= pull(surveys_arr[ceiling(((nrow(surveys_arr)+1)*3)/4), "weight"]), "large", "medium"))))
View(surveys_weight_size)
#bonus
data(iris)
View(iris)
summarize(iris, Petal.Length)
modFour <- nrow(Petal.Length) %% 4
arranged <- iris %>% arrange(Petal.Length)
   arranged %>% mutate(petal_med = case_when(Petal.Length <= arranged[floor((nrow(arranged)+1)/4),"Petal.Length"] ~ "small",
                                             Petal.Length > arranged[floor((nrow(arranged)+1)/4),"Petal.Length"] &
                                             Petal.Length < arranged[ceiling(((nrow(arranged)+1)*3)/4), "Petal.Length"] ~ "med",
                                             Petal.Length >= arranged[ceiling(((nrow(arranged)+1)*3)/4), "Petal.Length"] ~ "large"))
   






