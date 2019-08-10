# Question 5:   
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


# Read data 
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

# Get data required for plot
        BConroad <- subset(NEI, fips == "24510" & type == "ON-ROAD")
        plotdata <- aggregate(Emissions ~ year, BConroad, sum)
        
# Create plot and save to PNG file
        library(ggplot2)
        
        png("plot5.png", width = 480, height = 480)
        
        plot5 <- ggplot(plotdata, aes(factor(year), Emissions)) +
                        geom_bar(stat = "identity", fill = "#a3b6d6") +
                        xlab("Year") +
                        ylab(expression(PM[2.5] * " Emissions (tons)")) +
                        ggtitle(expression(PM[2.5] * " Emissions from Motor Vehicle Sources in Baltimore City"))
        
        print(plot5)
        dev.off()
