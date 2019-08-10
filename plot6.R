# Question 6:   
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
# sources in Los Angeles County?  Which city has seen greater changes over time?


# Read data 
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

# Get data required for plot
        library(dplyr)
        plotdata <- NEI %>%
                filter(type == "ON-ROAD" & (fips == "24510" | fips == "06037")) %>%
                group_by(fips, year) %>%
                summarize(sum_pm25 = sum(Emissions)) 
        
        # Add County column with county names
        plotdata$County <- ifelse(plotdata$fips == "24510", "Baltimore City", "Los Angeles County")
        
        
# Create plot and save to PNG file
        library(ggplot2)
        
        png("plot6.png", width = 540, height = 540)
        
        plot6 <- ggplot(plotdata, aes(x = factor(year), y = sum_pm25, group = County, color = County)) +
                        geom_line(size = 1) +
                        geom_point(size = 3) +
                        xlab("Year") +
                        ylab(expression(PM[2.5] * " Emissions (tons)")) +
                        ggtitle("Motor Vehicle Emissions in Baltimore City and Los Angeles County")
        
        print(plot6)
        dev.off()
