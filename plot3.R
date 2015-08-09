## Plot 3
## Plot of Energy vs Day


## Load the file from "household_power_consumption.txt"file
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


## Plot the submeters for plot3.png

  with(data, 
     {
      plot(Sub_metering_1~Datetime, type="l",
      ylab="Energy sub metering", xlab="")
      lines(Sub_metering_2~Datetime,col='Red')
      lines(Sub_metering_3~Datetime,col='Blue')
  }
  )

  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       lwd='1', col=c('black', 'red', 'blue')
       )


## Saves data to file

  dev.copy(png, file = "plot3.png", height = 480, width = 480)
  dev.off()