library(ggmap)
library(mapproj)
library(data.table)
library(dplyr)
library(data.table)


data87<-read.csv("士林.csv")

a<-c(8+15*c(0:364))
tail(a)

b<-c(0:8000)
d<-b[!b%in%a]

data87_transpose <- transpose(data87)
data87 <- data87_transpose[,-d]
data87 <- data87[-c(2:3),]
row.names(data87) <- c("Date",0:23)
colnames(data87) <- data87[1,]
data87 <- data87[-1,]

write.csv(data87,file="士林改.csv")


