function [train test] = fn_Train_test_469(data, RG)
% RG = [11,12,13,14,15,16,17,18,19,20];
%  [RG1 I] = fn_shuffle(RG);
%  RG1 = RG1';
 test_split = RG([4,6,9]);
%  valid_split = RG1(3:3);
 train_split = RG([1,2,3,5,7,8,10]);
 test_split_data =[];
%  valid_split_data=[];
 train_split_data = [];
 m = [1:3];
 for  i = m
 test_split_data = [test_split_data; data(data(:,12)==test_split(i),:)];
 end
%  p = [1:1];
%  for  i = p
%  valid_split_data = [valid_split_data; data(data(:,12)==valid_split(i),:)];
%  end
 n = [1:7];
 for  i = n
 train_split_data = [train_split_data; data(data(:,12)==train_split(i),:)];
 end
 train  = train_split_data;
%  valid = valid_split_data;
 test =  test_split_data;
 return 
 