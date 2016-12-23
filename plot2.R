dat <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat_sub <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
globalActivePower <- dat_sub$Global_active_power
datetime <- paste(dat_sub$Date, dat_sub$Time)
dat_sub$Datetime <- as.POSIXct(datetime)
plot(dat_sub$Datetime, dat_sub$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (Kilowatts)")
dev.copy(png, "plot2.png", height = 480, width = 480)
dev.off()
