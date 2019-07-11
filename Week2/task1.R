library(stats)
library(base)
library(dplyr)
library(ggplot2)
library(ggfortify)
library(tidyr)
library(magrittr)
a=c()
i=1979
while(i<2016){
  a<-append(a, toString(i), after = length(a))
  i=i+1
}
filename1 <- "Unemployment Rate by Year Since 1929 Compared to Inflation and GDP.csv"
data1<-read.csv(filename1)
data2<-data1%>%filter(data1$Year%in%a)
data2
filename2 <- "who_suicide_statistics.csv"
data3<-read.csv(filename2)
data4<-data3%>%filter(country=="United States of America",data3$year%in%a)
data5<-aggregate(data4$suicides_no, by=list(Category=data4$year), FUN=sum)/aggregate(data4$population, by=list(Category=data4$year), FUN=sum)
final<-data2%>%mutate(suicide_rate=data5$x)
colnames(final)=c("year","Unemployment_Rate","GDP","Inflation","What_Happened","suicide_rate")
final



ggplot(data = final, aes(x = year, y=suicide_rate)) +
  geom_point()
final %>%
  ggplot(aes(x=Unemployment_Rate, y=suicide_rate)) +
  geom_point(aes(col=Unemployment_Rate), position=position_jitter(width=.05)) +
  geom_smooth(method='lm',formula=y~x, se=F)
print(cor(final$Unemployment_Rate,final$suicide_rate))
