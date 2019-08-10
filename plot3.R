# Question 3:   
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008?


# Read data 
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

# Get data required for plot
        library(dplyr)
        plotdata <- NEI %>%
                filter(fips == "24510") %>%
                group_by(type, year) %>%
                summarize(sum_pm25 = sum(Emissions))

# Create plot and save to PNG file
        library(ggplot2)
        
        png("plot3.png", width = 480, height = 480)
        
        plot3 <- ggplot(plotdata, aes(factor(year), sum_pm25)) +
                        geom_bar(stat = "identity", fill = "light blue") +
                        facet_grid(. ~ type) +
                        xlab("Year") +
                        ylab(expression(PM[2.5] * " Emissions (tons)")) +
                        ggtitle(expression(PM[2.5] * " Emissions in Baltimore City by Source Type"))
        
        print(plot3)
        dev.off()
        
        