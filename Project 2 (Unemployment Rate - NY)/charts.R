
setwd("/Users/nukeguy5/Desktop/Data Science - CSCI365/Project 2 (Unemployment Rate - NY)")

load("NY_Unemployment_Data.Rdata")

library(ggplot2)
library(dplyr)

city_stat <- ny_all[ny_all$city == "Albany",]
avg_ue_count <- round(mean(city_stat$Unemployed), 2)

# https://stackoverflow.com/questions/39679057/r-ggplot2-stat-count-must-not-be-used-with-a-y-aesthetic-error-in-bar-graph
ue_hist <- ggplot(data=city_stat, aes(x = Year, y = Unemployed)) +
  geom_histogram(stat = "identity") +
  geom_hline(yintercept = avg_ue_count)
ue_hist

avg_ue_rate <- round(mean(city_stat$Unemployment.Rate), 2)
ue_line <- ggplot(data=city_stat, aes(x = Year, y = Unemployment.Rate)) +
  geom_line(stat = "identity", color = "red") +
  geom_hline(yintercept = avg_ue_rate, color = 'darkblue') +
  labs(y = "Number of people", title = "Unemployment Rate")

avg_lf <- round(mean(city_stat$Labor.Force), 0)
lf_line <- ggplot(data=city_stat, aes(x = Year, y = Labor.Force)) +
  geom_line(stat = "identity", color = "blue") +
  geom_hline(yintercept = avg_lf) +
  labs(y = "Number of People", title = "Labor Force")

grid.arrange(
  ue_hist, ue_line, lf_line,
  widths = c(2,2),
  layout_matrix = rbind(c(1,1),
                        c(2,3))
)
