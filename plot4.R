## This R script creates plot4.R

## Read the data set into R
energy_total <- read.table("household_power_consumption.txt", header = TRUE, 
                           sep = ";", na.strings = "?")

## Extract the data on 2007-02-01 and 2007-02-02
energy <- subset(energy_total, Date %in% c("1/2/2007", "2/2/2007"))

## Convert the Date and Time variables to Date/Time classes, and create a
## new variable called Date_time
energy$Date_time <- with(energy, strptime(paste(Date, Time), 
                                          format = "%d/%m/%Y %H:%M:%S"))

## Open the png graphics device
png(file = "plot4.png", width = 480, height = 480)

## Create multiple plots 
par(mfrow = c(2,2))

# 1. global active power vs. date_time
with(energy, plot(Date_time, Global_active_power, type = "l", xlab = "", 
                  ylab = "Global Active Power"))

# 2. voltage vs. date_time
with(energy, plot(Date_time, Voltage, type = "l", xlab = "datetime"))

# 3. sub metering vs. date_time
with(energy, plot(Date_time, Sub_metering_1, type = "l", xlab = "", 
                  ylab = "Energy sub metering"))
with(energy, lines(Date_time, Sub_metering_2, col = "red"))
with(energy, lines(Date_time, Sub_metering_3, col = "blue"))
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4. global reactive power vs. date_time
with(energy, plot(Date_time, Global_reactive_power, type = "l", lwd = 0.25,
                  xlab = "datetime"))

## Close the png graphics device
dev.off()