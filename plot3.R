library(dplyr)
#Reading both .rds files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Creating a copy of the NEI file
NEI_R <- NEI
NEI_R$type <- as.factor(NEI_R$type)

#Subsetting to keep Baltimore City data only

NEI_R <- filter(NEI_R, NEI_R$fips == "24510")

#Aggregating Emissions by year and type
Question3 <- aggregate(Emissions ~ year + type, NEI_R, sum)

#Creating the graph
dev.copy(png, file="plot3.png")

g <- qplot(year, Emissions, data = Question3, color = type, facets = type ~., xlab = "Year", ylab = "Emissions of" ~ PM[2.5] ~ "(tons)", main = "Emissions of" ~ PM[2.5] ~ "tons per Year in Baltimore City")
plot3 <- g + geom_line()

dev.off()
