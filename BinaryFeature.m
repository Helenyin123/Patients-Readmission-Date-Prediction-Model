function feature1 = BinaryFeature(feature)
%This function transfer Nominal or Numeric Feature to Binary Feature
% feature is the original data
% feature1 is the preprocessed data
n_sample = length(feature);
u = unique(feature);
nums = zeros(length(u),1);
binary = eye(length(u));
feature1 = zeros(n_sample,length(u));
for i = 1:n_sample
    for j = 1:length(u)
        if(isequal(feature(i),u(j)))
        feature1(i,:) = binary(j,:);
        nums(j) = nums(j) + 1;
        end
    end
end
percentage = nums/n_sample*100;

if(iscell(u))
    for i = 1:length(u)
        fprintf('%s =%5.3f%%   ',u{i},percentage(i));
    end
else
    for i = 1:length(u)
        fprintf('%d =%5.3f%%   ',u(i),percentage(i));
    end
end
    
end

