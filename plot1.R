## This R script creates plot1.R

## Read the data set into R
energy_total <- read.table("household_power_consumption.txt", header = TRUE, 
                           sep = ";", na.strings = "?")

## Extract the data on 2007-02-01 and 2007-02-02
energy <- subset(energy_total, Date %in% c("1/2/2007", "2/2/2007"))

## Open the png graphics device
png(file = "plot1.png", width = 480, height = 480)

## Create the histgram for global active power
hist(energy$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

## Close the png graphics device
dev.off()