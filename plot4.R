source("getdata.R") #we bring data
data <- data %>%
        mutate(wday = wday(Date, label = T, abbr = T), fdate = ymd_hms(paste(Date, Time))) %>%
        select(1:2, 10:11, 3:9) #right dataset
# graph
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data, {
        plot(fdate, Global_active_power, type = "l", 
             ylab = "Global active power [kW]", 
             xlab = NA) #plot2 1st quadrant
        plot(fdate, Voltage, type = "l", 
             ylab = "Voltage [V]", 
             xlab = "Date-time") #plot2 2nd quadrant
         # redo plot3 on 3rd quadrant
                plot(y=Sub_metering_1, x=fdate, type = "l", ylab = "Energy sub metering", xlab = NA) 
                lines(fdate, Sub_metering_2, 
                        col = "Red")
                lines(fdate, Sub_metering_3, 
                        col = "Blue")
                legend("topright", 
                        col = c("Black", "Red", "Blue"),
                       legend = names(data[9:11]),
                       lty = rep(1,3))
        # plot for 4th quadrant
        plot(fdate, Global_reactive_power, type = "l", 
             xlab = "Date time", 
             ylab = "Global reactive power [kVA]")
})

# that creates on windows the histogram
png( "plot4.png", width = 480, height = 480)
        par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
        with(data, {
                plot(fdate, Global_active_power, type = "l", 
                     ylab = "Global active power [kW]", 
                     xlab = NA) #plot2 1st quadrant
                plot(fdate, Voltage, type = "l", 
                     ylab = "Voltage [V]", 
                     xlab = "Date-time") #plot2 2nd quadrant
                # redo plot3 on 3rd quadrant
                plot(y=Sub_metering_1, x=fdate, type = "l", ylab = "Energy sub metering", xlab = NA) 
                lines(fdate, Sub_metering_2, 
                      col = "Red")
                lines(fdate, Sub_metering_3, 
                      col = "Blue")
                legend("topright", 
                       col = c("Black", "Red", "Blue"),
                       legend = names(data[9:11]),
                       lty = rep(1,3))
                # plot for 4th quadrant
                plot(fdate, Global_reactive_power, type = "l", 
                     xlab = "Date time", 
                     ylab = "Global reactive power [kVA]")
        })
dev.off()