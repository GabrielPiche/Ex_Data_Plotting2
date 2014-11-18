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

#Subsetting rows containing Coal or coal in the EI.Sector variable
Merged_R <- Merged[grepl("[C,c]oal", Merged$EI.Sector, ignore.case=T),]

#Getting sum of Emissions by year
Question4 <- aggregate(Emissions ~ year, Merged_R, sum)

#Plotting plot4
dev.copy(png, file="plot4.png")

plot4 <- plot(Question4$year, Question4$Emissions, type = "l", xlab = "Year", ylab = "Emissions of" ~ PM[2.5] ~ "(tons)", main = "Emissions from coal combustion-related sources in the US")

dev.off()
