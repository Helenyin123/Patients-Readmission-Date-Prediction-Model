%% main function - print out the preprocessing result
close all;
clc;
load 'nominal_data.mat';
fprintf('This Feature is Race.\n');
race1 = BinaryFeature(race);
fprintf('\nThis Feature is Gender.\n');
gender1 = BinaryFeature(gender);
fprintf('\nThis Feature is Gender.\n');
age1 = IntegerFeature(age);
fprintf('\nThis Feature is Admission Type.\n');
admission_type_id1 = BinaryFeature(admission_type_id);
fprintf('\nThis Feature is Discharge Disposition ID.\n');
discharge_disposition_id1 = BinaryFeature(discharge_disposition_id);
fprintf('\nThis Feature is Admission Source ID.\n');
admission_source_id1 = BinaryFeature(admission_source_id);
fprintf('\nThis Feature is Time in Hospital.\n');
time_in_hospital1 = IntegerFeature(time_in_hospital);
fprintf('\nThis Feature is Medical Specialty.\n');
medical_specialty1 = BinaryFeature(medical_specialty);
fprintf('\nThis Feature is Number of Lab Procedure.\n');
num_lab_procedures1 = IntegerFeature(num_lab_procedures);
fprintf('\nThis Feature is Number of Procedure.\n');
num_procedures1 = IntegerFeature(num_procedures);
fprintf('\nThis Feature is Number of Medications.\n');
num_medications1 = IntegerFeature(num_medications);
fprintf('\nThis Feature is Number of Outpatient.\n');
number_outpatient1 = IntegerFeature(number_outpatient);
fprintf('\nThis Feature is Number of Emergency Visits.\n');
number_emergency1 = IntegerFeature(number_emergency);
fprintf('\nThis Feature is Number of Inpatient.\n');
number_inpatient1 = IntegerFeature(number_inpatient);
fprintf('\nThis Feature is Diagnosis 1.\n');
diag_11 = Diagnosis(diag_1);
fprintf('\nThis Feature is Diagnosis 2.\n');
diag_21 = Diagnosis(diag_2);
fprintf('\nThis Feature is Diagnosis 3.\n');
diag_31 = Diagnosis(diag_3);
fprintf('\nThis Feature is Number of Diagnoses.\n');
number_diagnoses1 = IntegerFeature(number_diagnoses);
fprintf('\nThis Feature is Glucose Serum Test Result.\n');
max_glu_serum1 = IntegerFeature(max_glu_serum);
fprintf('\nThis Feature is A1c test Result.\n');
A1Cresult1 = IntegerFeature(A1Cresult);
fprintf('\nThis Feature is Change of Medications.\n');
change1 = BinaryFeature(change);
fprintf('\nThis Feature is Diabetes Medications.\n');
diabetesMed1 = BinaryFeature(diabetesMed);
fprintf('\nThis Feature is metformin.\n');
metformin1 = BinaryFeature(metformin);
fprintf('\nThis Feature is repaglinide.\n');
repaglinide1 = BinaryFeature(repaglinide);
fprintf('\nThis Feature is nateglinide.\n');
nateglinide1 = BinaryFeature(nateglinide);
fprintf('\nThis Feature is chlorpropamide.\n');
chlorpropamide1 = BinaryFeature(chlorpropamide);
fprintf('\nThis Feature is glimepiride.\n');
glimepiride1 = BinaryFeature(glimepiride);
fprintf('\nThis Feature is acetohexamide.\n');
acetohexamide1 = BinaryFeature(acetohexamide);
fprintf('\nThis Feature is glipizide.\n');
glipizide1 = BinaryFeature(glipizide);
fprintf('\nThis Feature is glyburide.\n');
glyburide1 = BinaryFeature(glyburide);
fprintf('\nThis Feature is tolbutamide.\n');
tolbutamide1 = BinaryFeature(tolbutamide);
fprintf('\nThis Feature is pioglitazone.\n');
pioglitazone1 = BinaryFeature(pioglitazone);
fprintf('\nThis Feature is rosiglitazone.\n');
rosiglitazone1 = BinaryFeature(rosiglitazone);
fprintf('\nThis Feature is acarbose.\n');
acarbose1 = BinaryFeature(acarbose);
fprintf('\nThis Feature is miglitol.\n');
miglitol1 = BinaryFeature(miglitol);
fprintf('\nThis Feature is troglitazone.\n');
troglitazone1 = BinaryFeature(troglitazone);
fprintf('\nThis Feature is tolazamide.\n');
tolazamide1 = BinaryFeature(tolazamide);
fprintf('\nThis Feature is examide.\n');
examide1 = BinaryFeature(examide);
fprintf('\nThis Feature is citoglipton.\n');
citoglipton1 = BinaryFeature(citoglipton);
fprintf('\nThis Feature is insulin.\n');
insulin1 = BinaryFeature(insulin);
fprintf('\nThis Feature is glyburidemetformin.\n');
glyburidemetformin1 = BinaryFeature(glyburidemetformin);
fprintf('\nThis Feature is glipizidemetformin.\n');
glipizidemetformin1 = BinaryFeature(glipizidemetformin);
fprintf('\nThis Feature is glimepiridepioglitazone.\n');
glimepiridepioglitazone1 = BinaryFeature(glimepiridepioglitazone);
fprintf('\nThis Feature is metforminrosiglitazone.\n');
metforminrosiglitazone1 = BinaryFeature(metforminrosiglitazone);
fprintf('\nThis Feature is metforminpioglitazone.\n');
metforminpioglitazone1 = BinaryFeature(metforminpioglitazone);

%Preprocessed Dataset
X = [race1,gender1,age1,admission_type_id1,discharge_disposition_id1,admission_source_id1...
    time_in_hospital1,medical_specialty1,num_lab_procedures1,num_procedures1,num_medications1...
    number_outpatient1,number_emergency1,number_inpatient1,diag_11,diag_21,diag_31,number_diagnoses1...
    change1,diabetesMed1,insulin1];

% Data Label
fprintf('\nThis is Readmitted.\n');
label = IntegerFeature(readmitted);

% save samples and label
save('numeric_data','X','label');

%% generate Test Data 
load 'numeric_data.mat';
% real training and testing sample
[train_sample,train_label,test_sample,test_label] = SampleGenerator(X,label); 
save('sample_label.mat','train_sample','test_sample','train_label','test_label');

% generate a small training and testing sample 
[train_sample,train_label,test_sample,test_label] = SmallSample(X,label); 
save('small_sample_label.mat','train_sample','test_sample','train_label','test_label');