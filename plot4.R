# Reading Raw Data

## Account for special NA character '?' and separator ';'
RawData <- read.table("../household_power_consumption.txt",sep = ";",
                      na.strings = "?",header = TRUE)

## Subset the Raw Date for thedates of interest
## Convert Time and Date into suitable readable formats
RawData <- subset(RawData,Date == "1/2/2007" | Date == "2/2/2007")
RawData$Time <- strptime(paste(RawData$Date,RawData$Time), "%d/%m/%Y %H:%M:%S")
RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")

# Plot Graph 4
## Setup Plotting area to accomodate 4 graphs to be drawn columnwise
par(mfcol = c(2,2), mar = c(5,4,2,1))
## Plot first graph
plot(x = RawData$Time, y = RawData$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

## Plot second graph
plot(x = RawData$Time, y = RawData$Sub_metering_1, ylab = "Energy sub metering", 
     xlab ="", type = "l")
lines(x = RawData$Time, y = RawData$Sub_metering_2, col="red")
lines(x = RawData$Time, y = RawData$Sub_metering_3, col="blue")

legend("topright",bty = "n", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "))

## Plot third graph
plot(x = RawData$Time, y = RawData$Voltage, ylab = "Voltage", 
     xlab = "datetime", type ="l")

## Plot fourth graph
plot(x = RawData$Time, y = RawData$Global_reactive_power, 
     ylab = "Global_reactive_power", xlab = "datetime", type ="l")

# Save the Graph to a PNG file of size 480 x 480 pixels (default) names plot4.png
dev.copy(png, file = "plot4.png")
dev.off()