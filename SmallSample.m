function [train_sample,train_label,test_sample,test_label] = SmallSample(X,label)
% the function will return training sample and its corresponding label
% testing sample and corresponding label
% ratio of training and testing sample is 50:50 in each class
% input is original data X and corresponding label
class1 = X(label ==1,:); 
class2 = X(label ==2,:); 
class3 = X(label ==3,:); 
n_class1 = size(class1,1);
n_class2 = size(class2,1);
n_class3 = size(class3,1);
test_loc1 = sort(randperm(n_class1,floor(n_class1*0.5)));% generate half size of class 1 with integer from 1 to size of class 1
test_loc2 = sort(randperm(n_class2,floor(n_class2*0.5)));       
test_loc3 = sort(randperm(n_class3,floor(n_class3*0.5)));
test1 = class1(test_loc1,:);
test2 = class2(test_loc2,:);
test3 = class3(test_loc3,:);
train_loc1 = [];
train_loc2 = [];
train_loc3 = [];
for i = 1:1:n_class1
    if(~any(i == test_loc1))
        train_loc1(end + 1) = i;
    end
end
for i = 1:1:n_class2
    if(~any(i == test_loc2))
        train_loc2(end + 1) = i;
    end
end
for i = 1:1:n_class3
    if(~any(i == test_loc3))
        train_loc3(end + 1) = i;
    end
end
train1 = class1(train_loc1,:);
train2 = class2(train_loc2,:);
train3 = class3(train_loc3,:);
test_sample = [test1(1:5000,:);test2(1:5000,:);test3(1:5000,:)];
train_sample = [train1(1:5000,:);train2(1:5000,:);train3(1:5000,:)];
test_label = [ones(5000,1);2 * ones(5000,1); 3 * ones(5000,1)];
train_label = [ones(5000,1);2 * ones(5000,1); 3 * ones(5000,1)];