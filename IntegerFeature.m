function feature1 = IntegerFeature(feature)
%This function transfer Nominal or Numeric Feature to Interger Feature
% feature is the original data
% feature1 is the preprocessed data
n_sample = length(feature);
u = unique(feature);
nums = zeros(length(u),1);
feature1 = zeros(n_sample,1);
for j = 1:n_sample
    for i = 1:length(u)
        if(isequal(feature(j),u(i)))
            feature1(j) = i;
            nums(i) = nums(i) +1;
        end
    end
end
percentage = nums/n_sample*100;

if(iscell(u)) 
    for i = 1:length(u)
        fprintf('%s(%d) =%5.3f%%   ',u{i},i,percentage(i));
    end
else
    for i = 1:length(u)
        fprintf('%d(%d) =%5.3f%%   ',u(i),i,percentage(i));
    end
end

end

