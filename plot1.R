#Reading both .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Creating a copy of the NEI file
NEI_R <- NEI

##Aggregating Emissions by year
Question1 <- aggregate(Emissions ~ year, NEI_R, sum)

#Plotting the chart and saving as plot1.png
dev.copy(png, file="plot1.png")

plot1 <- plot(Question1$year, Question1$Emissions, xlab = "Year", ylab = "Emissions of" ~PM[2.5] ~ "(tons)", main = "Emissions of" ~ PM[2.5] ~ "in tons per Year", type = "l")

dev.off()
