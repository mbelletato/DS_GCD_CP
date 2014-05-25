#Getting and Cleaning Data


##Tidy Data Instructions
The run_analysis.R script works as following:

1. Load TrainingSet[TRAIN_V] and TestSet[TEST_V] values from "X_train.txt" and "X_test.txt" files respectively.
2. Load Measures Names from "features.txt".
3. Filter only means and standard deviation measures.
4. Load TrainingSet[TRAIN_L] and TestSet[TEST_V] labels from "y_test.txt" and "y_train.txt" files respectively.
5. Bind (Column Bind) TestSet[TEST] and TrainingSet[TRAIN].
6. Create one Tidy DataSet[DATA] binding (Row Bind) both TEST and TRAIN.
7. Merge DATA and ACTIVITY into a complete DataSet.
8. Melt DATA
9. DCast melted DATA 
10. Write a file "tidyData.txt" using ";" as column separator.


After executing the analysis, DATA, MELTDATA and TIDYDATA should be used in order to perform further analysis.



###Scripts
* run_analysis.R: R script performing the Course Project analysis
* tidyData.txt: Final DataSet (Course Project - step 5)
* tidyData_1.txt: Complete Tidy DataSet
* ./data/: Main data folder containing Samsung data


###Data Frames
* MEANSTD_OK: Means and Standard Deviation measures
* ACTIVITY: Activity Labels
* TEST_V: Test Set (Values)
* TEST_L: Test Set (Labels)
* TEST: Test Set
* TRAIN_V: Training Set (Values)
* TRAIN_L: Training Set (Labels)
* TRAIN: Training Set
* MELTDATA: Melted DataSet
* TIDYDATA: Final DataSet (Variable Means ~ Subject + Activity)
