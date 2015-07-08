# Reading and subsetting the relevant data
# A new variable "New_Date" of POSIXct type is created by combining the "Date" and "Time" variables.

dat <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
dat$New_Date <- with(dat, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
subDat <- subset(dat, New_Date >= as.POSIXct("2007-02-01") & New_Date < as.POSIXct("2007-02-03"))

# Plotting "plot3.png"

png(file = "plot3.png", width = 480, height = 480)
with(subDat, plot(New_Date, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "" ))
with(subDat, points(New_Date, Sub_metering_1, type = "l"))
with(subDat, points(New_Date, Sub_metering_2, type = "l", col = "red"))
with(subDat, points(New_Date, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
