# Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008


# Read data 
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

# Sum PM 2.5 Emissions for each year and save in sumEM        
        sumEm <- aggregate(Emissions ~ year, NEI, sum)
        

# Create barplot and save to PNG file
        png("plot1.png", width = 480, height = 480)
        
        barplot(sumEm$Emissions, sumEm$year, names.arg = sumEm$year, col = "blue", 
                main = expression("Total PM"[2.5] * " Emissions"), ylim = c(0, 8000000), 
                xlab = "Year", ylab = expression(PM[2.5] * " Emissions (tons)"))
        
        dev.off()


        