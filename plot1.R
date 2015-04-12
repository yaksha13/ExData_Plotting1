# Reading Raw Date

# Account for special NA character '?' and separator ';'
RawData <- read.table("household_power_consumption.txt",sep = ";",
            na.strings = "?",header = TRUE)

## Subset the Raw Date for thedates of interest
## Convert Time and Date into suitable readable formats
RawDate <- subset(RawDate,Date == "1/2/2007" | Date == "2/2/2007")
RawData$Time <- strptime(paste(RawDate$Date,RawDate$Time), "%d/%m/%Y %H:%M:%S")
RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")

# Plot Graph 1
hist(x = y$Global_active_power,xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")

# Save the Graph to a PNG file of size 480 x 480 pixels names plot1.png