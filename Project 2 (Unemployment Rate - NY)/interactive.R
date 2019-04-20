library(leaflet)
library(dplyr)
library(maps)

source('charts.R')
# https://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html
counties <- map_data("county")
ny_county <- subset(counties, region == "new york") 
ny_base <- ggplot(data = ny_county) +
  geom_polygon(aes(x = long, y = lat, group = group), fill = "darkblue") +
  coord_fixed(1.3)
ny_base
