### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

if(!exists("NEISCC")){
  NEISCC <- merge(NEI, SCC, by="SCC")
}

#Path to include ggplot2 library
.libPaths("C:/Users/abhishek nigam/Documents/R/win-library/3.3")

## Plot 4
coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]
# Aggregate emissions
AggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEISCC, sum)
# Plot emission by year

png("plot4.png", width=640, height=480)
g <- ggplot(AggregatedTotalByYear,aes(factor(year),Emissions))
g <- g + geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()

