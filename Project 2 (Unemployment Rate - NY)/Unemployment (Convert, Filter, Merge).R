# https://catalog.data.gov/dataset/local-area-unemployment-statistics-beginning-1976

# setwd("/Users/nukeguy5/Desktop/Data Science - CSCI365/Project 2 (Unemployment Rate - NY")

# Load
load("us_cities.Rda")
ny_unemployment <- read.csv("Local_Area_Unemployment_Statistics__Beginning_1976.csv")


library(dplyr)
library(stringr)

# Filter - https://stackoverflow.com/questions/38850629/subset-a-column-in-data-frame-based-on-another-data-frame-list
cities <- us_cities
ny_cities <- cities[cities$state == "NY",]
# s <- strsplit(ny_cities$city, split = ' ')
# ny_cities$city <- sapply(s, "[", 1)  # https://stat.ethz.ch/pipermail/r-help/2008-April/159332.html
ny_cities$city <- ny_cities$city %>%
  str_remove_all(" NY")

# keep only cities, eliminate county data
ny_unemployment <- ny_unemployment %>%
  filter(str_detect(ny_unemployment$Area, c("City", "Town"))) # https://sebastiansauer.github.io/dplyr_filter/
  
# remove city/town from string
ny_unemployment$Area <- ny_unemployment$Area %>% 
  str_remove_all(" City") %>%
  str_remove_all(" Town")

# only keep matching cities
ny_filtered <- ny_unemployment[ny_unemployment$Area == unique(ny_cities$city),]

# merge
ny_all <- merge(ny_cities, ny_filtered, by.x = "city", by.y = "Area")

save(ny_all, file = "NY_Unemployment_Data.Rdata")
