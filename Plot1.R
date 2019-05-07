setwd("//tns-fbu-2f-224.corp.telenor.no/user-224$/t549668/Mine Dokumenter/R Prosjekt/exdata_data_household_power_consumption")

#Read datafile
Datafull <- read.csv2("household_power_consumption.txt",header = T);

datasub <- Datafull
rm(Datafull)

#Change format on Date
datasub$Date <- as.Date(datasub$Date, format="%d/%m/%Y")

#Subsetting date
datasub <- subset(datasub, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Concatenating Date and Time 
datasub$datetime <- paste(datasub$Date,datasub$Time)

#Change format on datetime
datasub$datetime <- strptime(datasub$datetime, "%Y-%m-%d %H:%M:%S")

#Create Plot file on device
png("plot1.png", width=480, height=480, units="px")

#Histogram
hist(as.numeric(as.character(datasub$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
