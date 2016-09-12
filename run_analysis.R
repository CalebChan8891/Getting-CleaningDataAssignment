
##download files
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "./data.zip")
unzip("./data.zip")

## Read files
library(data.table)
path <- getwd()
pathIn <- file.path(path, "UCI HAR Dataset")
list.files(pathIn, recursive =TRUE)
dtSubjectTrain <- fread(file.path(pathIn, "train", "subject_train.txt"),col.names = "Subject")
dtSubjectTest <- fread(file.path(pathIn, "test", "subject_test.txt"),col.names = "Subject")
dtActivityTrain <- fread(file.path(pathIn, "train", "y_train.txt"),col.names = "ActivityNum")
dtActivityTest <- fread(file.path(pathIn, "test", "y_test.txt"),col.names = "ActivityNum") ##give col.names here. if not, duplicated col names ("V1") will be removed when bind_rows
dtTrain <- fread(file.path(pathIn, "train", "X_train.txt"))
dtTest <- fread(file.path(pathIn, "test", "X_test.txt"))

# Merge to form one data set
library(dplyr)
DT_Test <- bind_cols(dtSubjectTest,dtActivityTest,dtTest)
DT_Train <- bind_cols(dtSubjectTrain,dtActivityTrain,dtTrain)
DT <- as.data.frame(bind_rows(DT_Test,DT_Train))

#Extact mean & sd columns.
dtFeatures <- fread(file.path(pathIn, "features.txt"))
index <- grep("mean|std",dtFeatures$V2)
index_real <- index+2
DT_meanstd <- DT[,c(1,2,index_real)]
        #rename variable names
names(DT_meanstd) <- c("Subject","ActivityNum",c((dtFeatures[index,])$V2))  

# Add activity names
DF_activity <- data.frame ("ActivityNum"=c(1:6),"Activity"=c("Walking", "WalkingUpstairs","WalkingDownstairs","Sitting","Standing","Laying"))
DT_final <- merge(DF_activity,DT_meanstd) 

## Create DF by melting and recasting average of each variable for each activity and subject
library(reshape2)
DT_Melt <- melt(DT_final,id=c("ActivityNum","Activity","Subject"),measure.vars = names(DT_final[,-c(1:3)]) )
DT_Cast <- dcast(DT_Melt, ActivityNum + Activity + Subject ~ variable,mean)
write.table(DT_Cast, "./tidydata.txt", sep=" ", row.names = FALSE)
