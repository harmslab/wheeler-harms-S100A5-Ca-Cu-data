###Pulls data into R from the .csv file. (Things with # symbols are not read by the program..useful for making notes).
# The function reads the .csv file as a table, must include the header statement and the separator statement. Leave these 
#the way they are for a .csv file. 

data <- read.table("all_spectra_conc-corrected.csv", header=TRUE, sep=",")

#Takes each column (just change the names accordingly for your file) and assigns it to its own "vector" just basically a list 
#of values. The $ symbol says "this header name" essentially, so you can specify which thing to grab from the vector. 

apoMME  <- data$apoMME
cuMME <- data$CuMME
caMME <- data$CaMME
cacuMME <- data$CaCuMME
cuEDTAMME <- data$CuEDTAMME
cacuEDTAMME <- data$CaCuEDTAMME
WL <- data$WL


min = min(caMME) + 0.1*min(caMME)

pdf("170601_hA5-C43S-C79S_farUV_MME_all.pdf")

plot(apoMME~WL, col="darkgray", lwd=3, type="l", ylim=c(min,5), xlim=c(200,250), main="2017-06-01 Far UV CD hS100A5-C43S-C79S", ylab="MME", xlab="Wavelength(nm)")
lines(caMME~WL, col="blue", lwd=3)
lines(cuMME~WL, col="orange", lwd=3)
lines(cacuMME~WL, col="red", lwd=3)
lines(cuEDTAMME~WL, col="green", lwd=3)
lines(cacuEDTAMME~WL, col="darkgreen", lwd=3)

legend("bottomright", legend=c("apo","500uM Ca", "500uM Cu", "500uM Ca/Cu", "CuEDTA", "CaCuEDTA"), 
       col=c('darkgray', 'blue', 'orange', 'red', 'green', 'darkgreen'), lty=1,lwd=3)  
dev.off()


pdf("170601_hA5-C43S-C79S_farUV_MME_key-states_conc-corrected.pdf")

plot(apoMME~WL, col="darkgray", lwd=3, type="l", ylim=c(min,5), xlim=c(200,250), main="2017-06-01 Far UV CD hS100A5-C43S-C79S", ylab="MME", xlab="Wavelength(nm)")
lines(caMME~WL, col="blue", lwd=3)
lines(cuMME~WL, col="orange", lwd=3)
lines(cacuMME~WL, col="red", lwd=3)


legend("bottomright", legend=c("apo","500uM Ca", "500uM Cu", "500uM Ca/Cu"), 
       col=c('darkgray', 'blue', 'orange', 'red'), lty=1,lwd=3)  
dev.off()




