# Software introduction
This code package is develeloped for constructing the seismic fragility analysis of reinforced concrete wall structures. 

# Developers
Developed by Hoang D. Nguyen (nguyenhoangkt712@unist.ac.kr), Chanyoung Kim, Young-Joo Lee, and Myoungsu Shin 
UNIST, South Korea

# Reference
Incopration of machine learning models to multilple stripe analysis of RC wall structures (Preparaton)

# Required software and libraries
Python 3.8 with Numpy version '1.24.3', and pickle

# Steps to use the package

Step 1: Download the developed RF models from the driver link (https://drive.google.com/drive/folders/1eTDLRCWzi_89QAJVV5M71K6k_TIzGZcD?usp=drive_link), then extract all developed RF models (BestModel_RF_IP1.sav and BestModel_RF_IP2.sav) in one folder.

Step 2: Prepare the input sets for ML models (i.e., DataForML_24S_InputSet1.txt for input set 1 (13 input variables) and DataForML_24S_InputSet2.txt (14 input variables) in the default).

Step 3: Run the python file PredictDamageStateOfRCWallStructures.ipynb to get the output from ML model (i.e., y_pred_RF_IP1.txt for input set 1 and y_pred_RF_IP2.txt for input set 2 in the default).

Setp 4: Run the matlab script DevelopFragilityCurve.m to obtain the fragility curve.

# Note
The matlab script fn_mle_pc_probit.m was obtained from the fragility fitting tool developed by Prof. Baker (https://www.jackwbaker.com/fragility.html).
