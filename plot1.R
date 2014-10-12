source("getdata.R") #we bring data
hist(data$Global_active_power[!is.na(data$Global_active_power)], 
     col = "Red", 
     xlab = "Global active power [kW]", 
     main = "Global active power")
# that creates on windows the histogram
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
