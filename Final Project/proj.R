library(ggmap)
library(mapproj)
library(data.table)
library(dplyr)
library(ggplot2)

key <-"AIzaSyAs0bekp6w-GMQbZUtnvCaRMPOaFYlS7R0"
register_google(key = key)

data911<-read.csv("喔氣氣氣氣氣.csv")
data911<-data911%>%filter(data90$Month=="18-Dec")

map <- get_map(location = 'Taiwan', zoom = 8)
ggmap(map) + geom_point(aes(x = data911$lon, y = data911$lat, size = data911$PM2.5), data = data911)