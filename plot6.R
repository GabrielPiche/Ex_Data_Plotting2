library(dplyr)
library(ggplot2)
#Reading both .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Creating a copy of the NEI file
NEI_R <- NEI
NEI_R$type <- as.factor(NEI_R$type)


#Subsetting to keep data for Baltimore City & LA, and ON_ROAD type

NEI_R <- filter(NEI_R, (NEI_R$fips == "24510" | NEI_R$fips == "06037") & NEI_R$type == "ON-ROAD")

#Getting sum of Emissions by year
Question6 <- aggregate(Emissions ~ year + fips, NEI_R, sum)

#Plotting the chart
png(file="plot6.png")
plot6_R <- qplot(year, Emissions, data = Question6, color = fips, geom="line", xlab = "Year", ylab = "Emissions of" ~ PM[2.5] ~ "(tons)", main = "Emissions from motor vehicle sources")
plot6 <- plot6_R +theme(legend.title = element_text(colour="black", size=10))+ theme(plot.title = element_text(size=14, face="bold")) + scale_colour_hue(name = "County",labels=c("Los Angeles County","Baltimore City"))
dev.off()