# Reading and subsetting the relevant data
# A new variable "New_Date" of POSIXct type is created by combining the "Date" and "Time" variables.

dat <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
dat$New_Date <- with(dat, as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
subDat <- subset(dat, New_Date >= as.POSIXct("2007-02-01") & New_Date < as.POSIXct("2007-02-03"))

# Plotting "plot2.png"

png(file = "plot2.png", width = 480, height = 480)
with(subDat, plot(New_Date,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" ))
dev.off()
