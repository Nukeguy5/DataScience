
drops <- c('Location', 'PdId')
sf_pr <- Police_Department_Incident_Reports_Historical_2003_to_May_2018[
  , !(names(Police_Department_Incident_Reports_Historical_2003_to_May_2018) %in% drops)]

library(plyr)
rename(sf_pr, c("X"="Longitude", "Y"="Latitude"))
sf_pr$Time <- format(as.POSIXct(strptime(sf_pr$Time,"%Y-%m-%d %H:%M",tz="")) ,format = "%H:%M")
save(sf_pr, file = "San_Francisco_Police_Reports_2003_to_May_2018.RData")

