source("getdata.R") #we bring data
data <- data %>%
        mutate(wday = wday(Date, label = T, abbr = T), fdate = ymd_hms(paste(Date, Time))) %>%
        select(1:2, 10:11, 7:9) #right dataset
#graph creation
with(data, plot(y=Sub_metering_1, x=fdate, type = "l", ylab = "Energy sub metering", xlab = NA), )
        lines(data$fdate, data$Sub_metering_2, 
              col = "Red")
        lines(data$fdate, data$Sub_metering_3, 
              col = "Blue")
        legend("topright", 
               col = c("Black", "Red", "Blue"),
               legend = names(data[5:7]),
                lty = rep(1,3))

# that creates on windows the histogram
png("plot3.png", width = 480, height = 480)
        with(data, plot(y=Sub_metering_1, x=fdate, type = "l", ylab = "Energy sub metering", xlab = NA), )
        lines(data$fdate, data$Sub_metering_2, 
              col = "Red")
        lines(data$fdate, data$Sub_metering_3, 
              col = "Blue")
        legend("topright", 
               col = c("Black", "Red", "Blue"),
               legend = names(data[5:7]),
               lty = rep(1,3))

dev.off()