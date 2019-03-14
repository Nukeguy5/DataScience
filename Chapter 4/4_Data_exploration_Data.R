# Save stations data
library(maps)
library("rnoaa")
station_data <- ghcnd_stations()
station_data <- station_data[grep('^US',station_data$id),]
save(station_data,file = 'stations_us.Rda')

# Save city statsions
element_list<-c('TMAX','TMIN','PRCP','SNOW')
sd2<-station_data[station_data$element %in% element_list,]
sd2<-sd2[sd2$last_year == 2019 & sd2$state %in% state.abb,]
library(dplyr)
sd2<-sd2 %>% group_by(id) %>% summarize(elements = length(element)) %>% filter(elements > 2)
us_stations<-sd2$id

sd3<-unique(station_data[station_data$id %in% us_stations, c('id','state','latitude','longitude','elevation')])
sd3$MERGE<-1
us_cities<-us.cities
us_cities$MERGE<-1

# Can also use dplyr::full_join
sd_cities<-merge(us_cities,sd3, by = 'MERGE', all=TRUE)
sd_cities$long_diff<-abs(sd_cities$long-sd_cities$longitude)
sd_cities$lat_diff<-abs(sd_cities$latitude-sd_cities$lat)
sd_cities$tot_diff<-sd_cities$lat_diff + sd_cities$long_diff
length(unique)
sd_cities<-sd_cities[sd_cities$tot_diff<1,]

library(geosphere)
dist_fun<- function(x,y,a,b){
  distm(c(x, y), c(a, b), fun = distHaversine)
}
sd_cities$distance<-mapply(sd_cities$long, sd_cities$lat, sd_cities$longitude, sd_cities$latitude
                           ,FUN = dist_fun)
# convert meters to miles
sd_cities$distance_miles<-sd_cities$distance/1609.344
city_stations<-sd_cities[sd_cities$distance_miles<20,
                         c('name','id','distance_miles')]
colnames(city_stations)<-c('city','station_id','distance_miles')
save(city_stations,file = 'city_stations.Rda')

# Save weather data
station_data <- unique(city_stations$station_id)
#weather_us <- meteo_pull_monitors(station_data,
#                                      date_min = '2018-12-01',
#                                      date_max = '2018-12-31')
#save(weather_us,file = 'weather_us.Rda')

# Save city data
cities_weather<-unique(city_stations$city)
us_cities<-us_cities[,1:5]
colnames(us_cities)<-c('city','state','pop','lat','long')
us_cities<-us_cities[us_cities$city %in% cities_weather,]
save(us_cities,file = 'us_cities.Rda')