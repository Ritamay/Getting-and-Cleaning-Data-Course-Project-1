#############################################################
# Run this script in the "UCI HAR Dataset"
#############################################################

if (!require("data.table")) install.packages("data.table")

if (!require("reshape2")) install.packages("reshape2")

require("data.table")
require("reshape2")

#Load activity labels and column names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#Load and process X_test & y_test data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) = features

#Load and process X_train & y_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features

# Quick check on loaded data dimension to make sure all are correct
dim(X_test)
dim(y_test)
dim(subject_test)
dim(X_train)
dim(y_train)
dim(subject_train)

#Extract the mean and standard deviation measurements only
extract_features <- grepl("mean|std", features)
X_test = X_test[,extract_features]

#Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("activity_ID", "activity_Label")
names(subject_test) = "subject"

#Combine data - adding columns
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

#Extract only the measurements on the mean and standard deviation for each measurement.
X_train = X_train[,extract_features]

#Load activity data
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("activity_ID", "activity_Label")
names(subject_train) = "subject"

#Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

#Merge test and train data
data = rbind(test_data, train_data)

id_labels   = c("subject", "activity_ID", "activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

# Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data   = dcast(melt_data, subject + activity_Label ~ variable, mean)


#############################################################
# Save tidy data into Excel and open the file
#############################################################
write.csv(tidy_data, "Tidy_Data.csv")
shell.exec(paste0(getwd(), "/Tidy_Data.csv"))
