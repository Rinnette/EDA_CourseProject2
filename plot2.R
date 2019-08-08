# Question 2: Have total emissions from PM2.5 decreased in Baltimore City, Maryland from 1999 to 2008


# Read data 
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

# Sum PM 2.5 Emissions in Baltimore City for each year and save in sumBC        
        BC <- subset(NEI, fips == "24510")
        sumBC <- aggregate(Emissions ~ year, BC, sum)


# Create barplot and save to PNG file
        png("plot2.png", width = 480, height = 480)
        
        barplot(sumBC$Emissions, sumBC$year, names.arg = sumBC$year, col = "orange", 
                main = expression("Total PM"[2.5] * " Emissions in Baltimore City"), xlab = "Year", 
                ylab = expression(PM[2.5] * " Emissions (tons)"), ylim = c(0, 3500))
        
        dev.off()


