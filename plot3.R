dat <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat_sub <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
globalActivePower <- dat_sub$Global_active_power
datetime <- paste(dat_sub$Date, dat_sub$Time)
dat_sub$Datetime <- as.POSIXct(datetime)
with(dat_sub, plot(Datetime, Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "l"))
with(dat_sub, points(Datetime, Sub_metering_2, xlab = "", 
                     ylab = "Energy sub metering", type = "l", col = "red"))
with(dat_sub, points(Datetime, Sub_metering_3, xlab = "", 
                     ylab = "Energy sub metering", type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2", 'Sub_metering_3'))
dev.copy(png, "plot3.png", height = 480, width = 480)
dev.off()