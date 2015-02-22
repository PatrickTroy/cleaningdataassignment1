PROVIDED CODEBOOK: ./UCI HAR Dataset/features.txt:


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


Before continuing, you MUST have an UNZIPPED copy of that exact folder in your working directory.
The script run_analysis.R will NOT check this for you.

The script (after being sourced) creates a specialized no-argument function called run_analysis which does the following:

The following data files are read in the script:
./UCI HAR Dataset/features.txt				
This contains the names of all of the movements/measurements

./UCI HAR Dataset/activity_labels.txt		
This contains the activity names that match the numbers given in the data

./UCI HAR Dataset/train/X_train.txt			
This contains the larger of the two datasets pertaining to the records for each measurement in features.txt

./UCI HAR Dataset/test/X_test.txt			
This contains the smaller of the two datasets pertaining to the records for each measurement in features.txt

./UCI HAR Dataset/train/subject_train.txt	
This contains the subjects (participants) for the larger dataset.

./UCI HAR Dataset/test/subject_test.txt		
This contains the subjects (participants) for the smaller dataset.

./UCI HAR Dataset/train/y_train.txt			
This contains the activity NUMBERS for the larger dataset.

./UCI HAR Dataset/test/y_test.txt			
This contains the activity NUMBERS for the smaller dataset.
The activity names were altered slightly to remove underscores and print in lowercase only.

Activity Number		
Activity Name

1           		
walking

2  					
walkingupstairs

3  					
walkingdownstairs

4 					
sitting

5  					
standing

6  		            
laying		

The dataset was pared down to only include measurements of the mean and standard deviation of movements, and not
any of the other measurements. 
Included measurements:

means and standard deviations of the following:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag


Ignored measurements were:

mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

For the previously listed parameters.


Also ignored:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

There are several lines to remove unwanted characters and whitespace from the column names of the measurements.
Characters removed are: ()- 

Also, names are changed to make them more descriptive:
t becomes time if at the start of a name
f becomes frequency if at the start of a name 

x,y,and z become xaxis, yaxis, and zaxis if at the end of a name

acc becomes acceleration

The following list shows original names and the altered (final) name:


Original Name:					
Descriptive Name:

activity						activity

subject							subject

tBodyAcc-mean()-X				timebodyaccelerationmeanxaxis

tBodyAcc-mean()-Y				timebodyaccelerationmeanyaxis

tBodyAcc-mean()-Z				timebodyaccelerationmeanzaxis

tBodyAcc-std()-X				timebodyaccelerationstdxaxis

tBodyAcc-std()-Y				timebodyaccelerationstdyaxis

tBodyAcc-std()-Z				timebodyaccelerationstdzaxis

tGravityAcc-mean()-X			timegravityaccelerationmeanxaxis

tGravityAcc-mean()-Y			timegravityaccelerationmeanyaxis

tGravityAcc-mean()-Z			timegravityaccelerationmeanzaxis

tGravityAcc-std()-X				timegravityaccelerationstdxaxis

tGravityAcc-std()-Y				timegravityaccelerationstdyaxis

tGravityAcc-std()-Z				timegravityaccelerationstdzaxis

tBodyAccJerk-mean()-X			timebodyaccelerationjerkmeanxaxis

tBodyAccJerk-mean()-Y			timebodyaccelerationjerkmeanyaxis

tBodyAccJerk-mean()-Z			timebodyaccelerationjerkmeanzaxis

tBodyAccJerk-std()-X			timebodyaccelerationjerkstdxaxis

tBodyAccJerk-std()-Y			timebodyaccelerationjerkstdyaxis

tBodyAccJerk-std()-Z			timebodyaccelerationjerkstdzaxis

tBodyGyro-mean()-X				timebodygyromeanxaxis

tBodyGyro-mean()-Y				timebodygyromeanyaxis

tBodyGyro-mean()-Z				timebodygyromeanzaxis

tBodyGyro-std()-X				timebodygyrostdxaxis

tBodyGyro-std()-Y				timebodygyrostdyaxis

tBodyGyro-std()-Z				timebodygyrostdzaxis

tBodyGyroJerk-mean()-X			timebodygyrojerkmeanxaxis

tBodyGyroJerk-mean()-Y			timebodygyrojerkmeanyaxis

tBodyGyroJerk-mean()-Z			timebodygyrojerkmeanzaxis

tBodyGyroJerk-std()-X			timebodygyrojerkstdxaxis

tBodyGyroJerk-std()-Y			timebodygyrojerkstdyaxis

tBodyGyroJerk-std()-Z			timebodygyrojerkstdzaxis

tBodyAccMag-mean()				timebodyaccelerationmagmean

tBodyAccMag-std()				timebodyaccelerationmagstd

tGravityAccMag-mean()			timegravityaccelerationmagmean

tGravityAccMag-std()			timegravityaccelerationmagstd

tBodyAccJerkMag-mean()			timebodyaccelerationjerkmagmean

tBodyAccJerkMag-std()			timebodyaccelerationjerkmagstd

tBodyGyroMag-mean()				timebodygyromagmean

tBodyGyroMag-std()				timebodygyromagstd

tBodyGyroJerkMag-mean()			timebodygyrojerkmagmean

tBodyGyroJerkMag-std()			timebodygyrojerkmagstd

fBodyAcc-mean()-X				frequencybodyaccelerationmeanxaxis

fBodyAcc-mean()-Y				frequencybodyaccelerationmeanyaxis

fBodyAcc-mean()-Z				frequencybodyaccelerationmeanzaxis

fBodyAcc-std()-X				frequencybodyaccelerationstdxaxis

fBodyAcc-std()-Y				frequencybodyaccelerationstdyaxis

fBodyAcc-std()-Z				frequencybodyaccelerationstdzaxis

fBodyAcc-meanFreq()-X			frequencybodyaccelerationmeanfreqxaxis

fBodyAcc-meanFreq()-Y			frequencybodyaccelerationmeanfreqyaxis

fBodyAcc-meanFreq()-Z			frequencybodyaccelerationmeanfreqzaxis

fBodyAccJerk-mean()-X			frequencybodyaccelerationjerkmeanxaxis

fBodyAccJerk-mean()-Y			frequencybodyaccelerationjerkmeanyaxis

fBodyAccJerk-mean()-Z			frequencybodyaccelerationjerkmeanzaxis

fBodyAccJerk-std()-X			frequencybodyaccelerationjerkstdxaxis

fBodyAccJerk-std()-Y			frequencybodyaccelerationjerkstdyaxis

fBodyAccJerk-std()-Z			frequencybodyaccelerationjerkstdzaxis

fBodyAccJerk-meanFreq()-X		frequencybodyaccelerationjerkmeanfreqxaxis

fBodyAccJerk-meanFreq()-Y		frequencybodyaccelerationjerkmeanfreqyaxis

fBodyAccJerk-meanFreq()-Z		frequencybodyaccelerationjerkmeanfreqzaxis

fBodyGyro-mean()-X				frequencybodygyromeanxaxis

fBodyGyro-mean()-Y				frequencybodygyromeanyaxis

fBodyGyro-mean()-Z				frequencybodygyromeanzaxis

fBodyGyro-std()-X				frequencybodygyrostdxaxis

fBodyGyro-std()-Y				frequencybodygyrostdyaxis

fBodyGyro-std()-Z				frequencybodygyrostdzaxis

fBodyGyro-meanFreq()-X			frequencybodygyromeanfreqxaxis

fBodyGyro-meanFreq()-Y			frequencybodygyromeanfreqyaxis

fBodyGyro-meanFreq()-Z			frequencybodygyromeanfreqzaxis

fBodyAccMag-mean()				frequencybodyaccelerationmagmean

fBodyAccMag-std()				frequencybodyaccelerationmagstd

fBodyAccMag-meanFreq()			frequencybodyaccelerationmagmeanfreq

fBodyBodyAccJerkMag-mean()		frequencybodybodyaccelerationjerkmagmean

fBodyBodyAccJerkMag-std()		frequencybodybodyaccelerationjerkmagstd

fBodyBodyAccJerkMag-meanFreq()	frequencybodybodyaccelerationjerkmagmeanfreq

fBodyBodyGyroMag-mean()			frequencybodybodygyromagmean

fBodyBodyGyroMag-std()			frequencybodybodygyromagstd

fBodyBodyGyroMag-meanFreq()		frequencybodybodygyromagmeanfreq

fBodyBodyGyroJerkMag-mean()		frequencybodybodygyrojerkmagmean

fBodyBodyGyroJerkMag-std()		frequencybodybodygyrojerkmagstd

fBodyBodyGyroJerkMag-meanFreq()	frequencybodybodygyrojerkmagmeanfreq

The entire tidy dataset is then written to a table saved as ./data.txt. 

THIS ASSUMES YOU DO NOT HAVE A FILE NAMED data.txt IN YOUR WORKING DIRECTORY



			