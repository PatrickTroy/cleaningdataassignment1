README.md

This readme pertains to the script run_analysis.R, a script for a specialized function that takes 8 separate data files
and creates a single tidy (wide) dataset aggregated from all of the data.

The script (after being sourced) creates a specialized no-argument function called run_analysis which does the following:

The following data files are read in the script:
./UCI HAR Dataset/features.txt				This contains the names of all of the movements/measurements

./UCI HAR Dataset/activity_labels.txt		This contains the activity names that match the numbers given in the data

./UCI HAR Dataset/train/X_train.txt			This contains the larger of the two datasets pertaining to the records for each measurement in features.txt
./UCI HAR Dataset/test/X_test.txt			This contains the smaller of the two datasets pertaining to the records for each measurement in features.txt

./UCI HAR Dataset/train/subject_train.txt	This contains the subjects (participants) for the larger dataset.
./UCI HAR Dataset/test/subject_test.txt		This contains the subjects (participants) for the smaller dataset.

./UCI HAR Dataset/train/y_train.txt			This contains the activity NUMBERS for the larger dataset.
./UCI HAR Dataset/test/y_test.txt			This contains the activity NUMBERS for the smaller dataset.

The training and test sets were to be merged to complete a single dataset. To accomplish this, the 
"X" data (train and test) was row bound together. Similarly, so were the subject data and the "y" data.

Each of these row bound sets were 10299 observations "long". They were then joined to each other ("X" to subject to "y").
For these data, no information had been changed added, deleted, or reordered. 

At this point, the features data, along with "subject" and "activity" were appended as column names of the constructed dataset.

The activity names were then changed from a number to the matching activity.
The activity names were altered slightly to remove underscores and print in lowercase only.

Activity Number		Activity Name
1           		walking
2  					walkingupstairs
3  					walkingdownstairs
4 					sitting
5  					standing
6  		            laying		

This was done using a for loop.

From here, the dataset was pared down to only include measurements of the mean and standard deviation of movements, and not
any of the other measurements. 

Details on what those measurements are, what they mean, and how names were translated are included in the file CodeBook.md

There are several lines to remove unwanted characters and whitespace from the column names of the measurements.

The included measurements were then melted (melt from the reshape2 package, required for this script)
with "activity" as the first identifier and "subject" as the second.

This molten data was cast using dcast using the following formula:activity+subject~variable and
aggregating by the mean of each measurement per the assignment requirements.

The entire tidy dataset is then written to a table saved as ./data.txt. 

THIS ASSUMES YOU DO NOT HAVE A FILE NAMED data.txt IN YOUR WORKING DIRECTORY