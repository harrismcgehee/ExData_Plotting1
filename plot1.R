

# Read in the data table
  data1 <- read.table(file="household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)
# str(data1)
# head(data1)

# Convert the date column to a Date
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

# Select the data from the dates 2007-02-01 and 2007-02-02
data2 <- data1[data1$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

# Clean up the large dataset
rm(data1)

# Create the png file
png(filename="plot1.png", width=480, height=480)
with(data2, hist(Global_active_power
                 , xlab = "Global Active Power (kilowatts)"
                 , ylab = "Frequency"
                 , main = "Global Active Power"
                 , col = "red"))
# Save the file
dev.off()

