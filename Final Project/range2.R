library(mapproj)
library(data.table)
library(dplyr)
library(ggplot2)
library(Imap)

data90<-read.csv("final.csv")
data1<-read.csv("火力發電廠.csv")

lon1<-(data90$lon)
lat1<-(data90$lat)
lon2<-(data1$lon)
lat2<-(data1$lat)

x<-c()
z<-1

for(i in c(1:74))
{
  for(j in c(1:24))
  {
    x[z]<-gdist(lon1[i],lat1[i],lon2[j],lat2[j],units="km")
    z<-z+1
  }
}


for(i in 1:length(x))
{
  if(x[i] < 50)
    x[i]<-TRUE
  else
    x[i]<-FALSE
}

a<-c()
y<-1
b<-c(1+24*c(0:73))
s<-0

for(i in b)
{
  for(j in c(i:(i+23)))
  {
    s<-s+x[j]
  }
  a[y]<-s
  s<-0
  y<-y+1
}

data90<-data90%>%mutate("Thermal power plant<50km"=a)
write.csv(file="8787878787.csv",data90)
