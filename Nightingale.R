library("readxl")
library("dplyr")
library("data.table")
library("ggplot2")
setwd("F:/MS/Masters/Data visualization")
data = read_excel("nightingale-data modified.xlsx");
data
str(data)
data = data[,c(1,6,7,8)]
datafirsthalf = data[0:36,]
datafirsthalf$Month = factor(datafirsthalf$Month,levels = unique(datafirsthalf$Month,ordered=TRUE))
datafirsthalf$Cause = factor(datafirsthalf$Cause,levels = c("Zymotic diseases","Wounds & injuries","All other causes"))
plot1 = ggplot(datafirsthalf, aes(x=Month,y=Deaths,fill = Cause)) + 
  geom_bar(stat = "identity",width = 1,color = "black") + 
 coord_polar() + theme(panel.background = element_blank(),
  axis.title= element_blank()    ,
  axis.title.y = element_blank() ,
  axis.text.y =element_blank(),
  axis.ticks.y = element_blank()
                       
                       
                       )

datasecondhalf = data[37:72,]
datasecondhalf$Month = factor(datasecondhalf$Month,levels = unique(datasecondhalf$Month,ordered=TRUE))
datasecondhalf$Cause = factor(datasecondhalf$Cause,levels = c("Zymotic diseases","Wounds & injuries","All other causes"))
plot2 = ggplot(datasecondhalf, aes(x=Month,y=Deaths,fill = Cause)) + 
  geom_bar(stat = "identity",width = 1,color = "black") + 
  coord_polar(start = 1.5708) + theme(legend.position = "none",panel.background = element_blank(),
                                      axis.title = element_blank()    ,
                                      axis.text.y =element_blank(),
                                      axis.ticks.y = element_blank()
                                      )

library("gridExtra")
grid.arrange(plot1,plot2)

positionOfplots = rbind(c(1,2),
                        c(3,2)
                        )
grid.arrange(plot1,plot2,layout_matrix = positionOfplots)



