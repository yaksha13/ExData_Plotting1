# Reading Raw Data

## Account for special NA character '?' and separator ';'
RawData <- read.table("../household_power_consumption.txt",sep = ";",
                      na.strings = "?",header = TRUE)

## Subset the Raw Date for thedates of interest
## Convert Time and Date into suitable readable formats
RawData <- subset(RawData,Date == "1/2/2007" | Date == "2/2/2007")
RawData$Time <- strptime(paste(RawData$Date,RawData$Time), "%d/%m/%Y %H:%M:%S")
RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")

# Plot Graph 2
## Commented out cex, for font resizing factor in RStudio
# par(cex = 0.7)
plot(x = RawData$Time, y = RawData$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

# Save the Graph to a PNG file of size 480 x 480 pixels(default) names plot2.png
dev.copy(png, file = "plot2.png")
dev.off()