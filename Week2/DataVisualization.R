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
data4<-data4%>%mutate(suicide_rate=data4$suicides_no/data4$population)
data5<-aggregate(data4$suicides_no, by=list(Category=data4$year), FUN=sum)/aggregate(data4$population, by=list(Category=data4$year), FUN=sum)
final<-data2%>%mutate(suicide_rate=data5$x)
colnames(final)=c("year","Unemployment_Rate","GDP","Inflation","What_Happened","suicide_rate")
final


data4$age <- factor(data4$age, levels = c("5-14 years","15-24 years", "25-34 years", "35-54 years", "55-74 years",   "75+ years" ), ordered = TRUE )

data86<-data4%>%filter(sex=="male")
data85<-data4%>%filter(sex=="female")
data88<-aggregate(data85$suicide_rate, by=list(Category=data85$age), FUN=mean)
data87<-aggregate(data86$suicide_rate, by=list(Category=data86$age), FUN=mean)
data87<-data87%>%rename(male_suicide_rate=x)
data88<-data88%>%rename(female_suicide_rate=x)
data89<-data87%>%mutate(female_suicide_rate=data88$female_suicide_rate)
vector<-data89$male_suicide_rate
values<-data89$female_suicide_rate
for (i in 1:length(values))
  vector[i+6] <- values[i]
vector
data90<-data.frame(Category=c("5-14 years","15-24 years", "25-34 years", "35-54 years", "55-74 years",   "75+ years","5-14 years","15-24 years", "25-34 years", "35-54 years", "55-74 years",   "75+ years" ),sex=c("male","male","male","male","male","male","female","female","female","female","female","female"),suicide_rate=vector)
data90$Category <- factor(data90$Category, levels = c("5-14 years","15-24 years", "25-34 years", "35-54 years", "55-74 years",   "75+ years" ), ordered = TRUE )

ggplot(data = data4, aes(x= age, y = suicide_rate, fill = sex )) + 
  geom_boxplot()

ggplot(data = data4, aes(x= age, y = suicide_rate, group = age, color = age)) + 
  geom_boxplot()

ggplot(data = data87, aes(x= sex, y = suicide_rate, fill=age)) +
  geom_bar(aes(x=factor(1),y=male_suicide_rate,fill=Category),stat = "identity") + coord_polar("y", start=0)

ggplot(data90,aes(x=sex ,y=suicide_rate, fill=Category))+geom_bar(stat="identity",position="dodge")

ggplot(data = final,aes(x=year)) +
  geom_point(aes(y=suicide_rate*500), ) + 
  geom_line(aes(y=suicide_rate*500, , color="cyan")) +
  geom_point(aes(y=Unemployment_Rate)) + 
  geom_line(aes(y=Unemployment_Rate, color="red"))


final %>%
  ggplot(aes(x=Unemployment_Rate, y=suicide_rate)) +
  geom_point(aes(col=Unemployment_Rate), position=position_jitter(width=.05)) +
  geom_smooth(method='lm', formula=y~x, se=F)
print(cor(final$Unemployment_Rate,final$suicide_rate))

