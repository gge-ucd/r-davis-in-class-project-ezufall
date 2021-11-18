mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
library(dplyr)
library(tidyr)
library(lubridate)
library(scico)
#With the mloa data.frame, remove observations with missing values in rel_humid, temp_C_2m, and windSpeed_m_s. 

mloaClean <- mloa %>% filter(rel_humid != -99, temp_C_2m != -999.9, windSpeed_m_s != -99.9) %>% 

#Generate a column called “datetime” using the year, month, day, hour24, and min columns. 
   #skipped this and used pipes
#Next, create a column called “datetimeLocal” that converts the datetime column to Pacific/Honolulu time 
   #(HINT: look at the lubridate function called with_tz()). 
   mutate(datetimeLocal = ymd_hm(paste(year,"-",month,"-",day,"-",hour24,"-",min), tz = "UTC") %>% with_tz(tzone = "US/Hawaii"))

#Then, use dplyr to calculate the mean hourly temperature each month using the temp_C_2m column and the datetimeLocal columns.
#(HINT: Look at the lubridate functions called month() and hour()). 
meanHourlyTemp <- mloaClean %>% group_by(month = month(datetimeLocal, label = T), hour = hour(datetimeLocal)) %>% summarize(mean_hourly_temp = mean(temp_C_2m))

#Finally, make a ggplot scatterplot of the mean monthly temperature, with points colored by local hour.
ggplot(meanHourlyTemp, aes(x = month, y = mean_hourly_temp, color = hour)) +
   geom_point()+
   scale_color_scico(palette = 'roma') +
   theme_classic() +
   labs(x = "Month", y = "Mean Hourly Temperature", title = "Mean Hourly Temperature by Month") 

   
  
#ggsave can save your plots