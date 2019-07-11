library(stats)
library(base)
library(dplyr)
library(ggplot2)
library(ggfortify)
filename1 <- "unemployment rate.csv"
data1<-read.csv(filename1)
filename2 <- "suicide.csv"
data2<-read.csv(filename2)
data5<-aggregate(data2$suicides_num, by=list(Category=data2$year), FUN=sum)/aggregate(data2$population, by=list(Category=data2$year), FUN=sum)
data1
final<-data1%>%mutate(suicide_rate=data5$x)
colnames(final)=c("year","Unemployment_Rate","GDP","Inflation","suicide_rate")
final
ggplot(data = final, aes(x = year, y=suicide_rate)) +
  geom_point()
ggplot(data = final, aes(x = Unemployment_Rate,)) +
  geom_point(aes(y=suicide_rate ))

final.lm <- lm(suicide_rate~Unemployment_Rate,
              data = final)