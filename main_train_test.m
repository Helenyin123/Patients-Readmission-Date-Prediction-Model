load 'sample_label.mat';

% if do PCA to training sample and testing sample
%[coeff,score,latent] = pca(train_sample);
%[coeff1,score1,latent1] = pca(test_sample);

% % train the classifier
%train_data = score(:,latent>0.1);% choose the component which has variance bigger than 0.1
%test_data = score1(:,latent1>0.1);

% if don't do pca
train_data = train_sample;
test_data = test_sample;
n_sample = size(train_data,1);
n_feature = size(train_data,2);

% one vs. all /one vs.one / percptron / mean -square-error
percep_OAA = multiclass(train_data',double(train_label)',test_data','[''OAA'', 0, ''Perceptron'', []]')';
mse_OAA = multiclass(train_data',double(train_label)',test_data','[''OAA'', 0, ''LS'', []]')';
percep_all = multiclass(train_data',double(train_label)',test_data','[''all-pairs'', 0, ''Perceptron'', []]')';
mse_all = multiclass(train_data',double(train_label)',test_data','[''all-pairs'', 0, ''LS'', []]')';% best-so-far

% f1 score
[w1_fl,conf1] = classification_report(test_label,percep_OAA,true);
figure;
[w2_fl,conf2] = classification_report(test_label,percep_all,true);
figure;
[w3_fl,conf3] = classification_report(test_label,mse_OAA,true);
figure;
[w4_fl,conf4] = classification_report(test_label,mse_all,true);

% parzen window/ k-nearest-neighborhood
knn_OAA = multiclass(train_data',double(train_label)',test_data','[''OAA'', 0, ''Nearest_Neighbor'', [50]]')';
knn_all = multiclass(train_data',double(train_label)',test_data','[''all-pairs'', 0, ''Nearest_Neighbor'', [50]]')';

%f1 score
[w5_fl,conf5] = classification_report(test_label,knn_OAA,true);
figure;
[w6_fl,conf6] = classification_report(test_label,knn_all,true);

% the following two function should be use in matlab 2015 version
% knn
model1 = fitcknn(train_data, train_label);
knn_predict = predict(model1,test_sample);
figure;
[w7_fl,conf7] = classification_report(test_label,knn_predict,true);

% Naive Bayes 
category = [1:9 11:61 69:95 97:104];
model1 = fitcnb(train_data, train_label,'CategoricalPredicators', category);
bayes_predict = predict(model1,test_sample);
figure;
[w8_fl,conf8] = classification_report(test_label,bayes_predict,true);




