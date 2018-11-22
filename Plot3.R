### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

## Plot 3
### Total PM2.5 emission in the Baltimore City from 1999 --> 2008
BNEI <-NEI[NEI$fips =='24510',]
# Aggregate emissions
AggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, BNEI, sum)
# Plot emission by year

png("plot3.png", width=640, height=480)
g <- ggplot(AggregatedTotalByYearAndType,aes(year,Emissions, color = type))
g <- g + geom_line() +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()


