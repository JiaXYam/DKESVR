%% DKESVR
clear 
clc
%%
X_train = importdata('Kernel_train.txt');
X_test = importdata('Kernel_test.txt');
Y_train = importdata('Y_train.txt');
Y_test = importdata('Y_test.txt');
X_train=mapminmax(X_train,0,1);
X_test=mapminmax(X_test,0,1);
%%
[c,g] = meshgrid(8:0.5:10,8:0.5:10);
[m,n] = size(c);
cg = zeros(m,n);
eps = 10^(-4);
v = 5;
bestc = 0;
bestg = 0;
error = Inf;
for i = 1:m
    for j = 1:n
        cmd = ['-v ',num2str(v),' -t 2',' -c ',num2str(2^c(i,j)),' -g ',num2str(2^g(i,j) ),' -s 3 '];
        cg(i,j) = svmtrain(Y_train,X_train,cmd);
        if cg(i,j) < error
            error = cg(i,j);
            bestc = 2^c(i,j);
            bestg = 2^g(i,j);
        end
        if abs(cg(i,j) - error) <= eps && bestc > 2^c(i,j)
            error = cg(i,j);
            bestc = 2^c(i,j);
            bestg = 2^g(i,j);
        end
    end
end
%%
% 2. 创建/训练SVM  
cmd = [' -t 2',' -c ',num2str(bestc),' -g ',num2str(bestg),' -s 3'];
DKESVRmodel= svmtrain(Y_train,X_train,cmd);
%%
[Predict_1,acc_1,pro1] = svmpredict(Y_train,X_train,DKESVRmodel);
[Predict_2,acc_2,pro2] = svmpredict(Y_test,X_test,DKESVRmodel);
%%
result_1 = [Y_train Predict_1];
result_2 = [Y_test Predict_2];
%%
save('DKESVRdata.mat','Y_train','X_train','Y_test','X_test')
save('DKESVRresult.mat','result_1','result_2')
save('DKESVRmodel.mat','DKESVRmodel')
dlmwrite('DKESVR_a.txt',DKESVRmodel.sv_coef,'delimiter', '\t')