#colNames prints a vector of the column names
#rowNames prints a vector of the row names

#case_when vs ifelse
#the tilde means "then" in the if-then
surveys %>% mutate(weight_cat = case_when(weight > mean(weight) ~ "big",
                                          weight < mean(weight) ~ "small"))
select(weight, weight_cat) %>% tail()

library(tidyverse)
#access built in R datasets with data()
#hard coding: 
#iris %>%  mutate(length_cat = ifelse(Petal.Length <= 1.6, "small", ifelse(Petal.Length >= 5.1, "large", "medium")))
data(iris)
View(iris)
summarize(iris, Petal.Length)
arranged <- iris %>% arrange(Petal.Length)
   arranged %>% mutate(petal_med = case_when(Petal.Length < arranged[nrow(arranged)/4,"Petal.Length"] ~ "small",
                                             Petal.Length > arranged[nrow(arranged)/4,"Petal.Length"] &
                                             Petal.Length < arranged[nrow(arranged)*3/4, "Petal.Length"] ~ "med",
                                             Petal.Length > arranged[nrow(arranged)*3/4, "Petal.Length"] ~ "large"))
   

surveys = read_csv("data/portal_data_joined.csv")
tail_length = read_csv("data/tail_length.csv")
str(tail_length)
str(surveys)
#look, record_id is the intersection
intersect(colnames(surveys),colnames(tail_length))


combo_dataframe = left_join(surveys,tail_length)
str(combo_dataframe)

#tally = num of observations
temp_df = surveys %>% group_by(year,plot_id) %>% tally()
temp_df = temp_df %>% ungroup()

pivot_wider(temp_df)
pivot_wider(temp_df,names_from = 'year',values_from = 'n')
#use pivot_wider on surveys with year as cols, plot_id as rows, and #genera per plot as vals
#values_fn = numberofgeneraperplot
#???? maybe not quite right
pivot_wider(data = surveys,id_cols = c('plot_id'),
            names_from = year,values_fn = n)
#of observations
pivot_wider(temp_df,id_cols = 'plot_id',names_from = 'year',values_from = 'n')

?n_distinct
surveys %>% group_by(plot_id,year) %>% summarize(distinct_genus = n_distinct(genus))

surveys %>% group_by(plot_id,year) %>% summarize(length(unique(genus)))

#what does n_distinct do?
#number of genuses per group
surveys %>% group_by(plot_id, year) %>% summarize(distinct_genus = n_distinct(genus))




