*The following code book describes the variables and the data in the tidy
dataset for this assignment and also an outline of the transformations and
steps that were taken to produce the tidy dataset.  This work evaluates the
average motion signals obtained from a study of 30 volunteers.  Each volunteer
wore a cellphone to measure motion data parameters while performing various 
motion activities.*


## Part 1:  Variable names and definitions.


	__Subject__  A number used to identify a volunteer who used a cellphone
        to collect motion data.  There were a total of 30 volunteers in
	the study.

	** Activity: **  Specific motion being performed to collect the data.  Can be
        one of 6 values:  'Laying', 'Sitting', 'Standing', 'Walking',
	'Walking Downstairs' or 'Walking Upstairs'.


	
	For the remaining following variable names, a 't' at the beginning of 
        the variable name corresponds to a time signal and an 'f' stands for 
	a frequency signal. Acceleration variables are in units of gravity 'g'
	and yyro angular velocity variables are in units of radians/sec. 



	** BodyAcc-mean()-XYZ: **  Mean value of signal of body acceleration
        in the X, Y or Z axis.

	** BodyAcc-std()-XYZ: **  Standard deviation of signal of body acceleration
	in the X, Y or Z axis.
	
	** GravityAcc-mean()-XYZ: **  Mean of gravity acceleration signal in the
	X, Y or Z axis.

	** GravityAcc-std()-XYZ: **  Standard deviation of signal of gravity in 
	the X, Y or Z axis. 

	** BodyAccJerk-mean()-XYZ: **  Mean of body acceleration jerk signal in 
	the X, Y or Z axis.

	** BodyAccJerk-std()-XYZ: **  Standard deviation of body acceleration jerk
        signal in the X, Y or Z axis.

	** BodyGyro-mean()-XYZ: **  Mean body gyro signal in the X, Y or Z axis.

	** BodyGyro-std()-XYZ: **  Standard deviation of body gyro signal in the
	X, Y or Z axis.

	** BodyGyroJerk-mean()-XYZ: **  Mean body gyro jerk signal in the X,Y or
	Z axis.

	** BodyGyroJerk-std()-XYZ: **  Standard deviation of body gyro jerk signal
	in the X,Y or Z axis.
	
	** BodyAccMag-mean(): **  Mean of the body acceleration magnitude
        signal.

	** BodyAccMag-std(): **  Standard deviation of the body acceleration 
	magnitude signal.

	** GravityAccMag-mean(): **  Mean of the gravity acceleration magnitude
	signal.

	** GravityAccMag-std(): **  Standard deviation of gravity acceleration magnitude
	signal.

	** Body(Body)AccJerkMag-mean(): **  Mean of the body acceleration jerk 
	magnitude signal.

	** Body(Body)AccJerkMag-std(): **  Standard deviation of the body 
	acceleration jerk magnitude signal.

	** BodyAccGyroMag-mean(): **  Mean of the body acceleration gyro magnitude
	signal.

	** BodyAccGyroMag-std(): **  Standard deviation of the body acceleration gyro
	magnitude signal.

	** Body(Body)GyroJerkMag-mean(): **  Mean of the body gyro jerk magnitude 
	signal.

	** Body(Body)GyroJerkMag-std(): **  Standard deviation of the body gyro jerk 
	magnitude signal.

	** BodyBodyGyroMag-mean(): **  Mean of the body gyro magnitude signal.

	** BodyBodyGyroMag-std(): **  Standard deviation of the body gyro magnitude
	signal.
	
	
## Part 2:  Description of the tidy data set.

	The final tidy data set displays the average(or mean) value of all acquired 
	signals for the signal variable names described above.  These average
        signal values are calculated over the original data for each of the 6 motion 
	types, for each of the 30 volunteers in the study.  


## Part 3:  Transformations performed to produce the tidy dataset in the R script.

	 	
	 ** Step 1: ** Working directory set to the course folder.
	 ** Step 2: ** Create a folder for the assignment data.
	 ** Step 3: ** Download the zipped dataset if it doesn't already exist locally.
	 ** Step 4: ** Set the working directory in which to analyze and clean the data.
	 ** Step 5: ** Read in the training and test data into the workspace.
	 ** Step 6: ** Read the signal type list (features) into the workspace.
	 ** Step 7: ** Set the column names of the training and test data to the 
		     feature list.
	 ** Step 8: ** Read in the motion activity types and convert them to factors.
	 ** Step 9: ** Add the motions for each measurement as a new column at the front
		     of the training and test data.
	 ** Step 10: ** Load the subject data into the workspace(volunteers 1 to 30) for
		      the training and test datasets.
	 ** Step 11: ** Add the subject data as a column at the front of the training
	  	      and test datasets.
	 ** Step 12: ** Merge the training and test data into one large dataset.
	 ** Step 13: ** Extract only the mean and standard deviation signals from
		      the merged dataset to create a 'reduced' dataset.
	 ** Step 14: ** Aggregate the reduced dataset to show the average values for
	              all signals in the reduced dataset, for each volunteer and for
		      each motion type.  This action will produce the tidy datset.

	 
	     
 


	 
	

	 

