source("getdata.R") #we bring data
data <- data %>%
        mutate(wday = wday(Date, label = T, abbr = T), fdate = ymd_hms(paste(Date, Time))) %>%
        select(1:2, 10:11, 3)
        
with(data, plot(fdate, Global_active_power, type = "l", ylab = "Global active power [kW]", xlab = NA))

# that creates on windows the histogram
png("plot2.png", width = 480, height = 480)
        with(data, plot(fdate, Global_active_power, type = "l", ylab = "Global active power [kW]", xlab = NA))
        
dev.off()