# Question 4:   
# Across the U.S., how have emissions from coal combustion-related sources changed from 1999-2008?


# Read data 
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

# Get data required for plot
        NEI$SCCname <- SCC$Short.Name[match(NEI$SCC, SCC$SCC)]
        coaldata <- NEI[grepl("Coal", NEI$SCCname, ignore.case = TRUE), ]
        plotdata <- aggregate(Emissions ~ year, coaldata, sum)

# Create plot and save to PNG file
        library(ggplot2)
        ggplot(plotdata, aes(factor(year), Emissions)) +
                geom_bar(stat = "identity", fill = "#0c8cb3") +
                xlab("Year") +
                ylab(expression(PM[2.5] * " Emissions (tons)")) +
                ggtitle(expression(PM[2.5] * " Emissions from Coal Combustion-related Sources"))
        
        ggsave("plot4.png")
