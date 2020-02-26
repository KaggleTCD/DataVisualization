library("readxl")
library("dplyr")
library("data.table")
library("ggplot2")
library("scales")
setwd("F:/MS/Masters/Data visualization")
data = read_excel("minard-data.xlsx");
library(dplyr)
#select relevant columns, rename columns's names and remove NA values
troops <- select(data, long = LONP, lat = LATP, survivors = SURV, direction = DIR, DIV)
cities <- na.omit(select(data, long = LONC, lat = LATC, CITY))
temp <-   na.omit(select(data, long = LONT, TEMP,MON,DAY))
#display tables
troops
layer1 <- ggplot(troops, aes(long, lat))
layer1
layer2 <- layer1 + geom_path(aes(size = survivors, color = direction, group = DIV), lineend = "round", linejoin = "round")
layer2
layer3 <- layer2 + geom_text(aes(label = CITY), size = 3, data = cities)
layer3
v <- c(1, 2, 3) * 10^5
finalGraph <- layer3 + scale_size("Survivors", range = c(1, 10), breaks = v, labels = comma(v)) +
  scale_color_manual("Direction", values = c("grey50", "black")) +
  xlab("Longitude") + ylab("Latitude") + ggtitle("Napoleon's march to Russia") + 
  theme(panel.background = element_rect(fill = "lightgoldenrod"),legend.position = "none")
finalGraph
temperature = ggplot(temp,aes(x = long,y= TEMP)) + geom_line(data = temp) + geom_text(aes(label = paste(MON,DAY)))