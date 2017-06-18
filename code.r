dataset <- read.table(file="covtype.data", sep=",", fill=FALSE, strip.white = TRUE)

ideal <- class.ind(dataset$V55)
datasetNormZ <- as.data.frame(scale(dataset[2:10]))
datasetF = cbind(datasetNormZ,dataset[11:54])

datasetrain <- sample(1:581012,406708)
datasetest <- setdiff(1:581012,datasetrain)

trainX = datasetF[datasetrain,]
trainY = ideal[datasetrain,]

testX = datasetF[datasetest,]
testY = datasetF[datasetest,]

covANN = nnet(trainX,trainY,size=16,softmax=TRUE,maxit=200)

table(predict(covANN,testX,type="class"),dataset[datasetest,]$V55)
