library(dplyr)
#Reading both .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Creating a copy of the NEI file
NEI_R <- NEI

#Subsetting to keep Baltimore City data only

NEI_R <- filter(NEI_R, NEI_R$fips == "24510")

##Aggregating Emissions by year
Question2 <- aggregate(Emissions ~ year, NEI_R, sum)

#Plotting the chart and saving as plot1.png
dev.copy(png, file="plot2.png")

plot2 <- plot(Question2$year, Question2$Emissions, xlab = "Year", ylab = "Emissions of" ~ PM[2.5] ~ "(tons)", main = "Emissions of" ~ PM[2.5] ~ "in tons per Year in Baltimore City", type = "l")

dev.off()
