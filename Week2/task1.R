library(stats)
library(base)
library(dplyr)
library(ggplot2)
library(ggfortify)
library(tidyr)
library(magrittr)
filename1 <- "unemployment rate.csv"
data1<-read.csv(filename1)
filename2 <- "suicide.csv"
data2<-read.csv(filename2)
data5<-aggregate(data2$suicides_num, by=list(Category=data2$year), FUN=sum)/aggregate(data2$population, by=list(Category=data2$year), FUN=sum)
data1
final<-data1%>%mutate(suicide_rate=data5$x)
colnames(final)=c("year","Unemployment_Rate","GDP","Inflation","suicide_rate")
fct_drop
final
ggplot(data = final, aes(x = year, y=suicide_rate)) +
  geom_point()
ggplot(data = final, aes(x = Unemployment_Rate,)) +
  geom_point(aes(y=suicide_rate ))+theme(axis.text.x= element_text(size=10, family="myFont", color="black", face= "bold", vjust=0.5, hjust=0.5))
final %>%
  ggplot(aes(x=Unemployment_Rate, y=suicide_rate)) +
  geom_point(aes(col=Unemployment_Rate), position=position_jitter(width=.05)) +
  geom_smooth(method='lm',formula=y~x, se=F)
