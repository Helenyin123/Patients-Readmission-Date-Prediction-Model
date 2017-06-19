# Patients-Readmission-Date-Prediction-Model


This is a pattern recognition model used to predict patients' readmission date according to 130 hospitals' diabete patients' data, use Matlab to implement. We used four models: Perceptron, Mean Square Error, K Nearest Neighborhood, Native Bayes Model.


1. The original data is diabetic_data.csv, after doing data preprocessing, we got nominal_data.mat as input to main_data_process.m
2. main_data_process.m do data cleaning and separate data into training and testing dataset using SampleGenerator.m
3. main_train_test.m use training dataset to train four models: Perceptron, Mean Square Error, K Nearest Neighborhood, Native Bayes Model. Then use test dataset to calculate F1 score and use classification_report.m to draw Normalized Confusion Matrix.

