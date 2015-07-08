# Reading and subsetting the relevant data
# A new variable "datetime" of POSIXct type is created by combining the "Date" and "Time" variables.

dat <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
dat$datetime <- with(dat, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
subDat <- subset(dat, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))

# Plotting "plot4.png"

png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# Top left plot
with(subDat, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# Top right plot
with(subDat, plot(datetime, Voltage, type = "l"))

# Bottom left plot
with(subDat, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "" ))
with(subDat, points(datetime, Sub_metering_1, type = "l"))
with(subDat, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(subDat, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", bty = "n", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom right plot
with(subDat, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
