library(dplyr)
library(ggplot2)
#Reading both .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Creating a copy of the NEI file
NEI_R <- NEI
NEI_R$type <- as.factor(NEI_R$type)

#Merging both files
Merged <- merge(NEI_R, SCC, by ="SCC")


#Subsetting to keep data for Baltimore City only and ON_ROAD type

Merged_R <- filter(Merged, Merged$fips == "24510" & Merged$type == "ON-ROAD")

#Getting sum of Emissions by year
Question5 <- aggregate(Emissions ~ year, Merged_R, sum)

#Plotting plot4
png(file="plot6.png")
plot6_R <- plot(Question6$year, Question6$Emissions, type = "l",xlab = "Year", ylab = "Emissions of" ~ PM[2.5] ~ "(tons)", main = "Emissions from motor vehicle sources in Baltimore City")
plot6 <- plot6_R+theme(legend.title = element_text(colour="black", size=12, face="bold")) + scale_colour_discrete(name="County") + theme(plot.title = element_text(size=14, face="bold"))
dev.off()
