# 108 Summer Data Science Programming Final Project Presentation---PM2.5 :cloud: in TW (Group 12)
## Team Members :bust_in_silhouette: 
[李明倫](https://github.com/Ellen0120/Ellen000)<br>[李秋蘭](https://github.com/LeeChiuLan/Data_Science_Programming_108)<br>[許煌浚](https://github.com/HuangChunHsu/Data-Science-Programming)
## Purpose & Key To Realization :key: 
We are interested in the PM2.5's change over time in Taiwan, not only in annual scale, but also in shorter periods such as the change in a week, in a day. Also, we're going to analyze the factors behind. Furthermore, to figure out whether incinerator and thermal power plant effects PM2.5 or not. 

To solve this problem, the key lies in to what relation between PM2.5 & incinerator and thermal power plant do we care about. Undoubtedly, the keypoint is the "distance". Thus, realization can be done with longitude & latitude.
![](https://i.imgur.com/wpJDN7e.png)
![](https://i.imgur.com/7rcuF63.png)
![](https://i.imgur.com/2sBiuF2.png)


## Source & Codes :open_file_folder: 
### [data source](https://erdb.epa.gov.tw/DataRepository/EnvMonitor/AirQualityMonitorDayData.aspx) : This data source is on Environmental Protection Administration Executive Yuan's website, which includes the data of PM2.5, PM10, sulfur dioxide, nitrogen oxide, methane...... from 74 stations in Taiwan (offshore islands are excluded),with the time domain is accurate to hours.
### [detail codes on GitHub](https://github.com/HuangChunHsu/Data-Science-Programming/tree/master/Final%20Project) 
### [detail pic source](https://drive.google.com/drive/folders/18yzudECUJ88HD1WH1LYIthmM1b6yWMHl)
## Process of Cleansing and Merging Data :bathtub: 
### Skeleton of the Process
![](https://i.imgur.com/tcQ7VIi.png)
### Initial Dataframe
![](https://i.imgur.com/WPsi5Wy.png)<font color=#0099ff size=7 face="黑体">  etc.</font>
### Final Dataframe
![](https://i.imgur.com/AoqMcLC.png)







## Data Visualization & Analysis :eyes: 

### Data Visualization
#### Annual PM2.5 change in TPE
![](https://i.imgur.com/pXnfKGY.png)

#### Weekly PM2.5 change in Winter (Guting)
![](https://i.imgur.com/UmS18Q0.png)
![](https://i.imgur.com/zKwnGZw.png)

#### Daily PM2.5 change in Winter (Guting)
![](https://i.imgur.com/V7WdI4G.png)
![](https://i.imgur.com/Obr7k5a.png)





#### GGmap + PM2.5
![](https://i.imgur.com/INemV0N.png)

### Data Analysis
Jan cor of Incinerator & PM2.5 in TPE : 0.7152351
Feb cor of Incinerator & PM2.5 in TPE : 0.5713561
Mar cor of Incinerator & PM2.5 in TPE : 0.4908234
Apr cor of Incinerator & PM2.5 in TPE : 0.2505967
May cor of Incinerator & PM2.5 in TPE : 0.3491188
Jun cor of Incinerator & PM2.5 in TPE : 0.2559961
Jul cor of Incinerator & PM2.5 in TPE : 0.3825460
Aug cor of Incinerator & PM2.5 in TPE : 0.5068532
Sep cor of Incinerator & PM2.5 in TPE : 0.5728220
Oct cor of Incinerator & PM2.5 in TPE : 0.5555556
Nov cor of Incinerator & PM2.5 in TPE : 0.5879447
Dec cor of Incinerator & PM2.5 in TPE : 0.5882433
##### Annual Change In Cor(Incinerator < 10km & PM2.5) 
![](https://i.imgur.com/V0Y35fC.png)


cor of Thermal Power Plant & PM2.5 in TW in Summer: 0.5171234
cor of Thermal Power Plant & PM2.5 in TW in Winter: -0.07836121
cor of Thermal Power Plant + Incinerator & PM2.5 in TW : 0.4171035

## Interactive Monthly Avg PM2.5 in 2018 By R-Shiny
[R-shiny](https://youtu.be/V5wQ2bdh-kI)

## Conclusion :1234: 
1. The northeast monsoon carries the pollutants from China and thus the average PM2.5 in winter is higher than in summer in Taiwan
2. PM2.5 in Yangming is relatively lower than other Stations in Taipei. We guess that maybe it is its geographical position (Yangmingshan) that makes the difference.
3. For the Weekly PM2.5 change, we originally planned to check whether ____day effects the PM2.5 or not. However, pitifully, we obtain little inference at all. For station in Taipei, PM2.5 on Sunday is slightly lower than it is on other days.
4. By observing Daily PM2.5 change in Winter (Guting), we can infer that rainfall lower the PM2.5 concentration.
5. By linear regression, we discover that Incinerator does play an important role in Taipei City, Especially, in winter. This can be explained by the depth of mixing layer. Mixing layer refers to the highest place where contaminants can reach. And the higher contaminants can reach, the lower concentration they are. In Taiwan, the depth of mixing layer is higher than it is in winter and therefore makes the effect of incinerators more apparently.
![](https://i.imgur.com/8CcOiqP.png)
![](https://i.imgur.com/dYZUJh0.png)



## Future Prospects :wave: 
This project focuses on only incinerators & Thermal power plants, therefore, the dearth of other factors such as climates, traffic emissions and so on also leads to the low correlation coefficient (thermal power plant & PM2.5). In the future, maybe we can take these variables into consideration to construct a more complete research.
