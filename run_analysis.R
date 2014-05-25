library(reshape2)

## MEANSTD_OK   : Means and Standard Deviation measures
## ACTIVITY     : Activity Labels
## TEST_V       : Test Set (Values)
## TEST_L       : Test Set (Labels)
## TEST_S       : Test Set (Subject)
## TEST         : Test Set
## TRAIN_V      : Training Set (Values)
## TRAIN_L      : Training Set (Labels)
## TRAIN_S      : Training Set (Subject)
## TRAIN        : Training Set
## MELTDATA     : Melted DataSet
## TIDYDATA     : Final DataSet (Variable Means ~ Subject + Activity)


MEANSTD_OK <- c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,
                121,122,123,124,125,126,161,162,163,164,165,166,
                201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,
                345,346,347,348,349,350,
                424,425,426,427,428,429,
                503,504,516,517,529,530,542,543)
ACTIVITY <- read.table("./data//activity_labels.txt")

##Load TrainingSet and TestSet Values
TEST_V <- read.table("./data//test//X_test.txt")
TRAIN_V <- read.table("./data//train/X_train.txt")
##Load Measures Names
names(TEST_V) <- read.table("./data/features.txt")[,2]
names(TRAIN_V) <- read.table("./data/features.txt")[,2]
##Filter MEANSTD_OK measures
TEST_V <- TEST_V[MEANSTD_OK]
TRAIN_V <- TRAIN_V[MEANSTD_OK]

##Load TrainingSet and TestSet Labels
TEST_L <- read.table("./data//test//y_test.txt")
TRAIN_L <- read.table("./data//train/y_train.txt")

##Load TrainingSet and TestSet Subjects
TEST_S <- read.table("./data//test//subject_test.txt", col.names=c("Subject"))
TRAIN_S <- read.table("./data//train/subject_train.txt", col.names=c("Subject"))

##Bind TestSet and TrainingSet
TEST <-  cbind(TEST_S, TEST_V,  TEST_L)
TRAIN <- cbind(TRAIN_S, TRAIN_V, TRAIN_L)

##Create one DataSet (TrainigSet + DataSet)
DATA <- rbind(TEST, TRAIN)

##Subject as factor\
DATA$Subject <- as.factor(DATA$Subject)

##Label Activity 
DATA <- merge(ACTIVITY, DATA, by="V1")
names(DATA)[1:2] <- c("ActivityID", "Activity")

##Melt DATA
MELTDATA <- melt(DATA, id=c("Subject", "Activity"), measure.vars=c(4:69))

##DCast melted DATA
TIDYDATA <- dcast(MELTDATA, Subject + Activity ~ variable, mean)

write.table(TIDYDATA, file="tidyData.txt", sep=";", row.names=F)