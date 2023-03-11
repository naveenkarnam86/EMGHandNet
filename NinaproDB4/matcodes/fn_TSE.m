function [feats_data]=fn_TSE(data)
% clc
% clear
% close all
% %%
% % load train_data_NP52.mat
% % load train_data_NP52.ma
% % load train_data_NP52.mat
% load train_data_comp.mat
train_data = data;
%%
Nsl = 10000;
% combo = combnk(1:5,2);
ModelOrder = 2;
Npwin = 4;
[rws,cols] =size(train_data);
Npat =  floor(rws/Nsl);
%%
for nx = 1:Npat
    feats_10ch = [];
    for clx = 1:cols
    pattern = train_data((nx-1)*Nsl+1:nx*Nsl,clx);
    Pseg  = abs(pattern);
             Lp = length(Pseg);
%        disp(Lp);
       pwn = floor(Lp/Npwin);
       for px = 1:Npwin
            pwind = ((Pseg((px-1)*pwn+1:px*pwn))).^2;
            pseg_av(px) = mean(pwind);
       end
       idata = log(pseg_av); 
       feats_10ch = [feats_10ch  idata(:)'];
    end
%      stem(feats_10ch);
%      drawnow;
%      pause(0.1)
     feats_data(nx,:) = feats_10ch;
end
return


