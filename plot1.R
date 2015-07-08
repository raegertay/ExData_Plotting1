# Reading and subsetting the relevant data

dat <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
subDat <- subset(dat, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Plotting "plot1.png"

png(file = "plot1.png", width = 480, height = 480)
with(subDat, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
