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
        ggplot(plotdata, aes(factor(year), sum_pm25, fill = County)) +
                geom_bar(stat = "identity") +
                facet_grid(County ~ ., scales = "free") +
                xlab("Year") +
                ylab(expression(PM[2.5] * " Emissions (tons)")) +
                ggtitle("Motor Vehicle Emissions in Baltimore City and Los Angeles County")
        
        ggsave("plot6.png")
