

#course project for getting and cleaning data




require("data.table")
require("reshape2")

############# Loading and processing test data

# Read the test data.
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
        
        
# Read the activity labels
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")[,2]
        
# Read data column names
features <- read.table("./data/UCI HAR Dataset/features.txt")[,2]
        
# Rename X_test columns by features
names(X_test) = features
        
# Create logical array which is TRUE for mean and standard deviation for each measurement and FALSE otherwise.
mean_sd_features <- grepl("mean|std", features)
        
# Extract measurements of mean and standard deviation from X_data
X_test = X_test[,mean_sd_features]
        
# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"
        
# Bind all the test data together
test_data <- cbind(as.data.table(subject_test), y_test, X_test)


#############Loading and processing training data

# Similarly read the training data
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
        
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
        
names(X_train) = features
        
# Extract measurements of mean and standard deviation from X_train
X_train = X_train[,mean_sd_features]
        
# Load activity labels
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"
        
# Bind all training data together
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train datasets
data = rbind(test_data, train_data)

#Assign column names and stack columns using 'melt'
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./data/tidy_data.txt")