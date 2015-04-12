# Reading Raw Date

# Account for special NA character '?' and separator ';'
RawData <- read.table("../household_power_consumption.txt",sep = ";",
                      na.strings = "?",header = TRUE)

## Subset the Raw Date for thedates of interest
## Convert Time and Date into suitable readable formats
RawData <- subset(RawData,Date == "1/2/2007" | Date == "2/2/2007")
RawData$Time <- strptime(paste(RawData$Date,RawData$Time), "%d/%m/%Y %H:%M:%S")
RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")

# Plot Graph 3
par(cex =0.7)
plot(x = RawData$Time, y = RawData$Sub_metering_1, ylab = "Energy sub metering", 
     xlab ="", type = "l")
lines(x = RawData$Time, y = RawData$Sub_metering_2, col="red")
lines(x = RawData$Time, y = RawData$Sub_metering_3, col="blue")

legend("topright",lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       text.width = strwidth("Sub_metering_3"))

# Save the Graph to a PNG file of size 480 x 480 pixels names plot3.png