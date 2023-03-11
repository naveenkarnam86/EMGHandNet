function  [Train_all Test_all] =fn_final_train_test_split_257(rawdata,Trial_length)
Train_all=[];
valid_all=[];
Test_all=[];
[m,n]=size(rawdata);
n_class=52;
% step = Trial_length;
    for i=1:1:n_class    
        classwisedata=rawdata(rawdata(:,n)==i,:);
         [classwisedata_TS,Total_trials]=fn_trial_labelling_E123(classwisedata,Trial_length);
       [train test] = fn_Train_test_split_classwise_257(classwisedata_TS,Total_trials);
%         Trial = fn_trial_wise_data_split_E123(classwisedata_TS)
        Train_all=[Train_all;train];
%         valid_all=[valid_all;valid];
        Test_all=[Test_all;test];
    end
   Train_all = Train_all(:, 1:n);
%    valid_all =valid_all(:, 1:11);
   Test_all = Test_all(:, 1:n);
return 