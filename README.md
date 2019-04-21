# Getting-and-Cleaning-Data-Week-4-Assignment

### Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.
Both variables were divided between two condition: training (70% of participants) and test (30% of participants)

### Code explaination
The code combined training dataset and test dataset, assigning the respective labels to each condition and misuration in the "X" and "y" datasets, said above. 
It then extracted partial variables to create a big data set containing all selected measures for all the subjects.
Then it created another dataset "part5" with the averages of each variable for each activity.

### The code was written based on the instruction of this assignment
1. Merges the training and the test sets to create one data set.
Use command rbind to combine training and test set
2. Extracts only the measurements on the mean and standard deviation for each measurement.
Use grep command to get column indexes for variable name contains "mean()" or "std()"
3. Uses descriptive activity names to name the activities in the data set
Convert activity labels to characters and add a new column as factor
4. Appropriately labels the data set with descriptive variable names.
Give the selected descriptive names to variable columns
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
