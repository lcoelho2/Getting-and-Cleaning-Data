# Project 1 Code Book
## Getting and Cleaning Data Project

The run_analysis.R steps: <br />
First and third part of the exercise <br />
1 - Load the txt files into data frames; Test, Test Activity Labels, Test Subjects, Trainning, Trainning Activity Labels and Trainning Subjects. The files are: <br />
X_test.txt                  <br />
y_test.txt                  <br />
subject_test.txt            <br />
X_train.txt                 <br />
y_train.txt                 <br />
subject_train.txt           <br />
activity_labels.txt         <br />
features.txt                <br />
2- Change some colunms name in the Test and Trainning data frames  <br />
3- Create the colunms Subject and activity in the Test and Trainning data frames and merge with the Activities data frame in order to get the activities names.   <br />
4- Merge the Test and Trainning rows  <br />
5- Namming the colunms in this new data set using the Features data frame  <br />

Second part of the exercise  <br />
1- Extracts only the columns with "mean" and "std" in the name without the ones with "Freq" in it  <br />

Fourth part of the exercise <br />
1- I found the labels already descriptive enough, so I left the original names <br />

Fifith part of the exercise  <br />
1- The scrip does the same thing as in Part 2, but adding the Subject and Activity Colunms <br />
2- Group that data set per Subject and Activity and apply the mean function to each variable <br /> <br /> <br />


About the variables, we have a description of them below   <br />
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. <br />
mean(): Mean value   <br />
std(): Standard deviation  <br />
mad(): Median absolute deviation   <br />
max(): Largest value in array  <br />
min(): Smallest value in array  <br />
sma(): Signal magnitude area  <br />
energy(): Energy measure. Sum of the squares divided by the number of values.   <br />
iqr(): Interquartile range  <br />
entropy(): Signal entropy   <br />
arCoeff(): Autorregresion coefficients with Burg order equal to 4  <br />
correlation(): correlation coefficient between two signals  <br />
maxInds(): index of the frequency component with largest magnitude  <br />
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  <br />
skewness(): skewness of the frequency domain signal   <br />
kurtosis(): kurtosis of the frequency domain signal   <br />
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  <br />
angle(): Angle between to vectors.  <br />
Acc - accelerometer    <br />
Gyro -gyroscope  <br />
t - to denote time captured at a constant rate of 50 Hz  <br />
f - to indicate frequency domain signals. Fast Fourier Transform (FFT) was applied to some of these signals. <br />
Body and Gravity - acceleration signal was separated into body and gravity acceleration signals <br />
Jerk - the body linear acceleration and angular velocity were derived in time to obtain Jerk signals  <br />
MAg - magnitude of these three-dimensional signals were calculated using the Euclidean norm  <br />





