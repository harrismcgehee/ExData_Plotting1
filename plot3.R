
# Read in the data table
data1 <- read.table(file="household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)
# str(data1)
# head(data1)

# Convert the date column to a Date
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# Select the data from the dates 2007-02-01 and 2007-02-02
data2 <- data1[data1$Date %in% as.Date(c("2007-02-01","2007-02-02")),]
data2$DateTime <- as.POSIXct(paste(data2$Date,data2$Time,sep = " "), format = "%Y-%m-%d %H:%M:%S", tz="")

# Clean up the large dataset
rm(data1)

# Create the png file
png(filename="plot3.png", width=480, height=480)
with(data2, plot(DateTime,Sub_metering_1
                 , ylab = "Energy sub metering"
                 , xlab = ""
                 , type = "n"))

with(data2, lines(DateTime,Sub_metering_1
                 , type = "l"))
with(data2, lines(DateTime,Sub_metering_2
                 , col = "red"
                 , type = "l"))
with(data2, lines(DateTime,Sub_metering_3
                 , col = "blue"
                 , type = "l"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty="solid", col=c(1,2,4))
dev.off()

