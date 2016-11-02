#Installation: bioconductor, DNAshapeR, caret
source("https://bioconductor.org/biocLite.R")
biocLite()
biocLite("DNAshapeR")
install.packages("caret")

#Initialize
library(DNAshapeR)
library(caret)
workingPath <- "/Users/AnjaliChakravarti/Desktop/BISC481-master/gcPBM/"



#BEGIN MAD

#DNA shape prediction for Mad 1-mer + shape
fn_fasta <- paste0(workingPath, "Mad.txt.fa")
pred <- getShape(fn_fasta)

#Feature vectors
featureType <- c("1-mer", "1-shape")
featureVector <- encodeSeqShape(fn_fasta, pred, featureType)
head(featureVector)

#MLR model
fn_exp <- paste0(workingPath, "Mad.txt")
exp_data <- read.table(fn_exp)
df <- data.frame(affinity=exp_data$V2, featureVector)

#Set arguments
trainControl <- trainControl(method = "cv", number = 10, savePredictions = TRUE)

#Run prediction (no L2-regularized)
model <- train (affinity~ ., data = df, trControl=trainControl, 
                method = "lm", preProcess=NULL)
summary(model)

#Run Prediction (L2-regularized)
model2 <- train(affinity~., data = df, trControl=trainControl, 
                method = "glmnet", tuneGrid = data.frame(alpha = 0, lambda = c(2^c(-15:15))))
model2
result <- model2$results$Rsquared[1]

#DNA shape prediction for Mad 1-mer
fn_fasta <- paste0(workingPath, "Mad.txt.fa")
pred <- getShape(fn_fasta)

#Feature vectors
featureType <- c("1-mer")
featureVector <- encodeSeqShape(fn_fasta, pred, featureType)
head(featureVector)

#MLR model
fn_exp <- paste0(workingPath, "Mad.txt")
exp_data <- read.table(fn_exp)
df <- data.frame(affinity=exp_data$V2, featureVector)

#Set Arguments
trainControl <- trainControl(method = "cv", number = 10, savePredictions = TRUE)

#Run prediction (no L2-regularized)
model <- train (affinity~ ., data = df, trControl=trainControl, 
                method = "lm", preProcess=NULL)
summary(model)

#Run prediction (L2-regularized)
model2 <- train(affinity~., data = df, trControl=trainControl, 
                method = "glmnet", tuneGrid = data.frame(alpha = 0, lambda = c(2^c(-15:15))))
model2
result <- model2$results$Rsquared[1]



#BEGIN MAX

#DNA shape prediction for Max 1-mer + shape
fn_fasta <- paste0(workingPath, "Max.txt.fa")
pred <- getShape(fn_fasta)

#Feature vectors
featureType <- c("1-mer", "1-shape")
featureVector <- encodeSeqShape(fn_fasta, pred, featureType)
head(featureVector)

#MLR model
fn_exp <- paste0(workingPath, "Max.txt")
exp_data <- read.table(fn_exp)
df <- data.frame(affinity=exp_data$V2, featureVector)

#Set arguments
trainControl <- trainControl(method = "cv", number = 10, savePredictions = TRUE)

#Run prediction (no L2-regularized)
model <- train (affinity~ ., data = df, trControl=trainControl, 
                method = "lm", preProcess=NULL)
summary(model)

#Run prediction (L2-regularized)
model2 <- train(affinity~., data = df, trControl=trainControl, 
                method = "glmnet", tuneGrid = data.frame(alpha = 0, lambda = c(2^c(-15:15))))
model2
result <- model2$results$Rsquared[1]

#DNA shape prediction for Mad 1-mer
fn_fasta <- paste0(workingPath, "Max.txt.fa")
pred <- getShape(fn_fasta)

#Feature vectors
featureType <- c("1-mer")
featureVector <- encodeSeqShape(fn_fasta, pred, featureType)
head(featureVector)

#MLR model
fn_exp <- paste0(workingPath, "Max.txt")
exp_data <- read.table(fn_exp)
df <- data.frame(affinity=exp_data$V2, featureVector)

#Set arguments
trainControl <- trainControl(method = "cv", number = 10, savePredictions = TRUE)

#Run prediction (no L2-regularized)
model <- train (affinity~ ., data = df, trControl=trainControl, 
                method = "lm", preProcess=NULL)
summary(model)

#Run prediction (L2-regularized)
model2 <- train(affinity~., data = df, trControl=trainControl, 
                method = "glmnet", tuneGrid = data.frame(alpha = 0, lambda = c(2^c(-15:15))))
model2
result <- model2$results$Rsquared[1]



#BEGIN MYC

#DNA shape prediction for Myc 1-mer + shape
fn_fasta <- paste0(workingPath, "Myc.txt.fa")
pred <- getShape(fn_fasta)

#Feature vectors
featureType <- c("1-mer", "1-shape")
featureVector <- encodeSeqShape(fn_fasta, pred, featureType)
head(featureVector)

#MLR model
fn_exp <- paste0(workingPath, "Myc.txt")
exp_data <- read.table(fn_exp)
df <- data.frame(affinity=exp_data$V2, featureVector)

#Set arguments
trainControl <- trainControl(method = "cv", number = 10, savePredictions = TRUE)

#Run prediction (no L2-regularized)
model <- train (affinity~ ., data = df, trControl=trainControl, 
                method = "lm", preProcess=NULL)
summary(model)

#Run prediction (L2-regularized)
model2 <- train(affinity~., data = df, trControl=trainControl, 
                method = "glmnet", tuneGrid = data.frame(alpha = 0, lambda = c(2^c(-15:15))))
model2
result <- model2$results$Rsquared[1]

#DNA shape prediction for Myc 1-mer
fn_fasta <- paste0(workingPath, "Myc.txt.fa")
pred <- getShape(fn_fasta)

#Feature vectors
featureType <- c("1-mer")
featureVector <- encodeSeqShape(fn_fasta, pred, featureType)
head(featureVector)


#MLR model
fn_exp <- paste0(workingPath, "Myc.txt")
exp_data <- read.table(fn_exp)
df <- data.frame(affinity=exp_data$V2, featureVector)

#Set arguments
trainControl <- trainControl(method = "cv", number = 10, savePredictions = TRUE)

#Run prediction (no L2-regularized)
model <- train (affinity~ ., data = df, trControl=trainControl, 
                method = "lm", preProcess=NULL)
summary(model)

#Run prediction (L2-regularized)
model2 <- train(affinity~., data = df, trControl=trainControl, 
                method = "glmnet", tuneGrid = data.frame(alpha = 0, lambda = c(2^c(-15:15))))
model2
result <- model2$results$Rsquared[1]