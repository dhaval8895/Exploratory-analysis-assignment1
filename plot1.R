dat <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat_sub <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")
globalActivePower <- dat_sub$Global_active_power
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()