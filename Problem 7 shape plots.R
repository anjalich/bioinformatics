#Initialize
library(DNAshapeR)

#Get sequences
fn <- system.file("extdata", "CGRsample.fa", package = "DNAshapeR")

#Run DNA Shape Prediction
pred <- getShape(fn)

#Plot Minor groove shape
plotShape(pred$MGW)

#Plot Propeller twist shape
plotShape(pred$ProT)

#Plot Helix Twist Shape
plotShape(pred$HelT)

#Plot Roll shape
plotShape(pred$Roll)