### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plot 2
### Total PM2.5 emission in the Baltimore City from 1999 --> 2008
BNEI <-NEI[NEI$fips =='24510',]
# Aggregate emissions
Emissions <- aggregate(BNEI$Emissions, by=list(BNEI$year), FUN=sum)
names(Emissions)[1] <- "Year"

# Plot emission by year
#png("plot2.png")
barplot(Emissions$x,
        Emissions$Year,
        ylab = "TotalPM2.5 emission",
        xlab = "Year",
        names.arg = Emissions$Year,
        main = "Total PM2.5 emission in the Baltimore City "
)
#dev.off()