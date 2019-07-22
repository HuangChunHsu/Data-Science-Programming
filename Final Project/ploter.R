library(mapproj)
library(data.table)
library(dplyr)
library(ggplot2)

data30<-read.csv("空氣品質監測月值.csv")
data30<-data30%>%filter(data30$縣市=="臺北市")

data30$Month <- factor(data30$Month, levels = c("18-Jan","18-Feb", "18-Mar", "18-Apr", "18-May", "18-Jun", "18-Jul", "18-Aug", "18-Sep", "18-Oct", "18-Nov", "18-Dec"), ordered = TRUE )

ggplot(data = data30, aes(x=Month, y= PM2.5,group=Site)) + 
  geom_line(aes(color=Site))

data31<-read.csv("8787878787.csv")
p<-data31$Incinerator.10km
q<-data31$Thermal.power.plant.50km
data31<-data31%>%mutate("Incinerator+TPP"=p+q)
#data31<-data31%>%filter(data31$區域=="中南區")
cor(data31$Thermal.power.plant.50km, data31$PM2.5) 
