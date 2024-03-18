clc
clear all
close all

%% Input for fragiility curve
iThreshold=0.7; % threshold value of MIDR
InputFile = load('DataForML_24S_InputSet1.txt'); % input file for ML model
ResultML=load('y_pred_RF_IP1.txt'); % output from RF model
ConsiderGMType = "No"; % "Yes" or "No"
GMType = 3; % If the GM type is consdsiderd, please input the type as 1 = FF, 2 = NF-Pulse, 3 = NF-No Pulse
x_vals = 0.01:0.001:3; % IM levels to plot fragility function
IM=0.1:0.1:1; %range of IM. In this study, the PGA ranged from 0.1f to 1.0f with an interval of 0.1g
%% analysis
Data=[InputFile ResultML];
Result=[];

if ConsiderGMType == "Yes"
    NumOfColumn=15;
    for i=1:1:length(IM)
        iIM=round(IM(i),2);
        irow_IM=Data(find(round(Data(:,1),2)==iIM),:); %find rows have iIM
        irow_IM_GMType=irow_IM(find(irow_IM(:,NumOfColumn-2)==GMType),:);

        NumberofGM(i) = length(irow_IM_GMType(:,1));
        Fragility_ML(i) = length(find(irow_IM_GMType(:,NumOfColumn)==2));
    end
else
    NumOfColumn=14;
    for i=1:1:length(IM)
        iIM=round(IM(i),2);
        irow_IM=Data(find(round(Data(:,1),2)==iIM),:);
        NumberofGM(i) = length(irow_IM(:,1));
        Fragility_ML(i) = length(find(irow_IM(:,NumOfColumn)==2));
    end
end



% Plot
num_gms=NumberofGM;
p_collapse_probit=Fragility_ML;
plot(IM,p_collapse_probit./num_gms*100,'k.','MarkerSize',10);
hold on
[theta_hat_probit, beta_hat_probit] =  fn_mle_pc_probit(IM, num_gms, p_collapse_probit);
p_collapse_probit_ML = normcdf((log(x_vals/theta_hat_probit))/beta_hat_probit); % compute fragility function using equation 1 and estimated parametersp_collapse_mle_Real = normcdf((log(IM/FC_Real(16,1)))/FC_Real(16,2)); % compute fragility function using equation 1 and estimated parameters
plot(x_vals,p_collapse_probit_ML*100);
grid on
xlabel('PGA, g')
ylabel('Failure probability, %');
