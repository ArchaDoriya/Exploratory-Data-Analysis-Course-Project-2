## Data preparation
### Download the data file
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
fname = "Assignment2_data.zip"
download.file(url,fname)
### Unzip the file
unzip(fname)
### Read the files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plot 1
### Total PM2.5 emission from 1999 --> 2008
# Aggregate emissions
Emissions <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
names(Emissions)[1] <- "Year"

# Plot emission by year
#png("plot1.png")
barplot(Emissions$x,
        Emissions$Year,
        ylab = "TotalPM2.5 emission",
        xlab = "Year",
        names.arg = Emissions$Year,
        main = "Total PM2.5 emission"
)
#dev.off()

