#Install packages
install.packages("caret")
install.packages("e1071")
install.packages("ROCR")


#Initialize
library(DNAshapeR)
library(caret)
library(ROCR)
workingPath <- "/Users/AnjaliChakravarti/Desktop/BISC481-master/CTCF/"

#Generate the classifcation data 
#Assign to bound
boundFasta <- readDNAStringSet(paste0(workingPath, "bound_30.fa"))
sequences <- paste(boundFasta)
boundTxt <- data.frame(seq=sequences, isBound="Y")

#Assign to non-bound
nonboundFasta <- readDNAStringSet(paste0(workingPath, "unbound_30.fa"))
sequences <- paste(nonboundFasta)
nonboundTxt <- data.frame(seq=sequences, isBound="N")

#Merge datasets
writeXStringSet( c(boundFasta, nonboundFasta), paste0(workingPath, "ctcf.fa"))
exp_data <- rbind(boundTxt, nonboundTxt)


#Generate DNAshapeR prediction
pred <- getShape(paste0(workingPath, "ctcf.fa"))


#AUROC for 1-mer + shape
#Feature vectors
featureType <- c("1-mer", "1-shape")
featureVector <- encodeSeqShape(paste0(workingPath, "ctcf.fa"), pred, featureType)
df <- data.frame(isBound = exp_data$isBound, featureVector)


#Logistic regression modeling
#Set Caret Parameters
trainControl <- trainControl(method = "cv", number = 10, 
                             savePredictions = TRUE, classProbs = TRUE)
#Run prediction
model <- train(isBound~ ., data = df, trControl = trainControl,
               method = "glm", family = binomial, metric ="ROC")
summary(model)

#Plot AUROC
prediction <- prediction( model$pred$Y, model$pred$obs )
performance <- performance( prediction, "tpr", "fpr" )
plot(performance)

#Caluculate AUROC
auc <- performance(prediction, "auc")
auc <- unlist(slot(auc, "y.values"))
auc


#AUROC for 1-mer
#Feature vectors
featureType <- c("1-mer")
featureVector <- encodeSeqShape(paste0(workingPath, "ctcf.fa"), pred, featureType)
df <- data.frame(isBound = exp_data$isBound, featureVector)


#Logistic regression modeling
#Set Caret Parameters
trainControl <- trainControl(method = "cv", number = 10, 
                             savePredictions = TRUE, classProbs = TRUE)
#Run prediction
model <- train(isBound~ ., data = df, trControl = trainControl,
               method = "glm", family = binomial, metric ="ROC")
summary(model)

#Plot AUROC
prediction <- prediction( model$pred$Y, model$pred$obs )
performance <- performance( prediction, "tpr", "fpr" )
plot(performance)

#Caluculate AUROC
auc <- performance(prediction, "auc")
auc <- unlist(slot(auc, "y.values"))
auc