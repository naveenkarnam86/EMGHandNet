clc; clear all; close all;
train_process_data = []; test_process_data = [];
train_process_sub_wise_data=[];
test_process_sub_wise_data=[];
train_raw_data=[];test_raw_data=[];
% valid_process_data = [];
n_class=52;Trial_length=10000;
myfolder = dir('/media/naveen/nav/mat_codes/nina_DB4_codes/olsson_DB4/sub_wise/S*');
% fullMatFileName = fullfile(destdirectory,  'gesture_rawdata.mat')
L=length(myfolder);
N_sub = L;
for sub=1:L
 basefilename=myfolder(sub).name;
 fullfilename=fullfile(myfolder(sub).folder,basefilename);
 tempdata=load(fullfilename);
 sub_data=tempdata.sub_wise_data; 
 [train_raw_data test_raw_data]=fn_final_train_test_split_25(sub_data,Trial_length,n_class);
 train_process_sub_wise_data= fn_raw_trial_MVMD(train_raw_data,Trial_length);
%  train_process_data=[train_process_data;train_process_sub_wise_data];
 
destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/prep_LP_MVMD_wave/sub_wise_process_TT/';
mkdir(destdirectory);   %create the director
file1 = sprintf('S%d_tr.csv',sub);
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
% save(fulldestination, 'Train_process_data','Test_process_data');
csvwrite(fulldestination,train_process_sub_wise_data);
train_process_sub_wise_data=[];
 test_process_sub_wise_data= fn_raw_trial_MVMD(test_raw_data,Trial_length);
%  test_process_data=[test_process_data;test_process_sub_wise_data];
file2 = sprintf('S%d_tt.csv',sub);
fulldestination = fullfile(destdirectory, file2);
csvwrite(fulldestination,test_process_sub_wise_data);
test_process_sub_wise_data=[];
disp(sub);
end

for sub=1:L
file1 = sprintf('S%d_tr.csv',sub);
fulldestination = fullfile(destdirectory, file1);
train_process_sub_wise_data = csvread(fulldestination);
train_process_data=[train_process_data;train_process_sub_wise_data];
train_process_sub_wise_data=[];
disp(sub);
end

for sub=1:L
file2 = sprintf('S%d_tt.csv',sub);
fulldestination = fullfile(destdirectory, file2);
test_process_sub_wise_data = csvread(fulldestination);
test_process_data=[test_process_data;test_process_sub_wise_data];
test_process_sub_wise_data=[];
disp(sub);
end
destdirectory = '/media/naveen/nav/mat_codes/nina_DB4_codes/prep_LP_MVMD_wave/Total_process_TT/';
mkdir(destdirectory);   %create the directory
file1 = sprintf('nina_pro_naveen_DB4_MVMD_wave_train.csv');
fulldestination = fullfile(destdirectory, file1);%name file relative to that directory
csvwrite(fulldestination, train_process_data); 
file2 = sprintf('nina_pro_naveen_DB4_MVMD_wave_test.csv');
fulldestination = fullfile(destdirectory, file2);%name file relative to that directory
csvwrite(fulldestination, test_process_data); d

file3 = sprintf('nina_pro_naveen_DB4_MVMD_wave_train_mat.mat');
fulldestination = fullfile(destdirectory, file3);
save(fulldestination, 'train_process_data');
file4 = sprintf('nina_pro_naveen_DB4_MVMD_wave_test_mat.mat');
fulldestination = fullfile(destdirectory, file4);
save(fulldestination, 'test_process_data');

% file3=sprintf('rami_15class_8sub_TT.mat');
% fulldestination = fullfile(destdirectory, file3);
% save(fulldestination, 'train_process_data','test_process_data');
