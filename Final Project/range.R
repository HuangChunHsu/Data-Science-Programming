library(mapproj)
library(data.table)
library(dplyr)
library(ggplot2)
library(Imap)

data87<-read.csv("空氣品質監測月值.csv")
data88<-read.csv("經緯.csv")
data90<-merge(data87,data88,by="Site")
data90<-data90%>%filter(data90$Month=="18-Jan")
data1<-read.csv("焚化爐.csv")

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
  if(x[i] < 10)
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

data90<-data90%>%mutate("Incinerator<10km"=a)
write.csv(file="final.csv",data90)
