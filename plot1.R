## Plot 1
## Histogram of Frequency vs Global Active Power


## Fetch the data from "Household_power_consumption.txt" file
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


## Plot the histogram for plot1.png
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red"
     )


## Saves data to file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()