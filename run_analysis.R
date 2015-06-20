
# reading data sets from both groups and binding together
data_ts <- read.table("UCI HAR Dataset/test/X_test.txt")
data_tr <- read.table("UCI HAR Dataset/train/X_train.txt")
data <- rbind(data_ts, data_tr)

# reading column names and applying to the data frame
col_names <- read.table("UCI HAR Dataset/features.txt")
col_names_l <- col_names$V2
colnames(data) <- col_names_l

# choosing only mean and standard deviation
ch_std <- data[grep("std()",names(data),fixed = TRUE)]
ch_mean <- data[grep("mean()",names(data),fixed = TRUE)]
data_ch <- cbind(ch_mean, ch_std)

# reading labels and adding as an extra column
lab_ts <- read.table("UCI HAR Dataset/test/y_test.txt")
lab_tr <- read.table("UCI HAR Dataset/train/y_train.txt")
lab_all <- rbind(lab_ts, lab_tr)
data_lab <- cbind(data_ch, lab_all)

# reading activity labels and adding names to the data frame as an extra column
act_lab <- read.table("UCI HAR Dataset/activity_labels.txt")
lab_l <- as.character(act_lab$V2)
 for(st in c(1:6)){data_lab$act_nm[data_lab$V1 == st] <- lab_l[st]}
 
#reading subjects and adding as an extra column 
sub_ts <- read.table("UCI HAR Dataset/test/subject_test.txt")
sub_tr <- read.table("UCI HAR Dataset/train/subject_train.txt")
sub_all <- rbind(sub_ts, sub_tr)
data_lab <- cbind(data_lab, sub_all)

# renaming the column name
colnames(data_lab)[69] <- "subject" 

# calculating mean for each subject and activity type using aggregate function (applying mean only to first 66 column)
data_aggr <- aggregate(data_lab[, 1:66], by=list(data_lab$act_nm, data_lab$subject), FUN=mean, na.rm=TRUE)

# changing names of columns used for grouping
colnames(data_aggr)[1] <- "activity"
colnames(data_aggr)[2] <- "subject"
 
# writing table to the output file 
write.table(data_aggr, file = "test.txt",row.name=FALSE)
