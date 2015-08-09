## Plot 2
## Plot of Global Active Power vs day


## Load the fullset of data from "household_power_consumption.txt"file
base_data <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ';', na.strings = "?", check.names = FALSE, 
                        stringsAsFactors = FALSE, comment.char="", quote='\"'
                        )

base_data$Date <- as.Date(base_data$Date, format="%d/%m/%Y")


## Subset the data based on the desired time span
## Here only the data from 2007-02-01 to 2007-02-02 will be selected
data <- subset(base_data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(base_data)


## Converts dates
date_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_time)


## Plot the line for plot2.png
plot(data$Global_active_power~data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


## Saves data to file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()