function feature1 = Diagnosis(feature)
%This function transfer Diagnosis Features to Binary Features According to ICD9 
% feature is the original data
% feature1 is the preprocessed data
n_sample = length(feature);
u = {'Circulatory','Respiratory','Digestive','Diabetes','Injury','Musculoskeletal','Genitourinary','Neoplasms','Other'};
nums = zeros(length(u),1);
feature1 = zeros(n_sample,length(u));
binary = eye(length(u));
for i = 1:n_sample
    if(390 <= feature(i) && feature(i) <= 459 || feature(i)==785)
        feature1(i,:) = binary(1,:);
        nums(1) = nums(1) + 1;
    else if(460 <= feature(i) && feature(i) <= 519 || feature(i)==786)
        feature1(i,:) = binary(2,:);
        nums(2) = nums(2) + 1;
        else if(520 <= feature(i) && feature(i) <= 579 || feature(i)==787)
        feature1(i,:) = binary(3,:);
        nums(3) = nums(3) + 1;
            else if(isfloat(feature(i)))
                    feature1(i,:) = binary(4,:);
                    nums(4) = nums(4) + 1;
                else if(800 <= feature(i) && feature(i) <= 999)
                        feature1(i,:) = binary(5,:);
                        nums(5) = nums(5) + 1;
                    else if(710 <= feature(i) && feature(i) <= 739)
                        feature1(i,:) = binary(6,:);
                        nums(6) = nums(6) + 1;
                        else if(580 <= feature(i) && feature(i) <= 629 || feature{i}==788)
                                feature1(i,:) = binary(7,:);
                                nums(7) = nums(7) + 1;
                            else if(140 <= feature(i) && feature(i) <= 239)
                                    feature1(i,:) = binary(8,:);
                                    nums(8) = nums(8) + 1;
                                else
                                    feature1(i,:) = binary(9,:);
                                    nums(9) = nums(9) + 1;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
percentage = nums/n_sample*100;

for i = 1:length(u)
    fprintf('%s =%5.3f%%   ',u{i},percentage(i));
end
end
                                    
                        
                    
            