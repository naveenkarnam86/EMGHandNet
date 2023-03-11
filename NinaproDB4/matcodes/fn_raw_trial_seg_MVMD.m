function [process_data]=fn_raw_trial_seg_MVMD(raw_data,Trail_length)
process_data=[];
step=Trail_length;
[m,n]=size(raw_data);
   for i=0:step:m-step
         prep_data=fn_prep_seg_MVMD_wave(raw_data(i+1:i+step,1:n-1));
         [m1,n1]=size(prep_data);
         class_label=raw_data(i+1:i+m1,n);
         trial_data=[prep_data,class_label];
         process_data=[process_data; trial_data];
%        end
   end
       return
