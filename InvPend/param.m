% Clear persistent variables in functions
clear pendulum
clear drawPendulum
clear controller

% Define initialization parameters
P.x0 = [0;0;0;0];%Initial States [ x; theta; xdot; thetadot]
P.g  = 9.8;  % gravity
P.M  = 1; % cart mass kg
P.m  = 0.1; % pendulum bob weight
P.L  = 2; % length of pendulum rod meters
P.k = 1.0;
P.R  = 4;
P.r  = 0.02;

% Define the Performance weightings  Q, R here

P.Q = eye(2);
P.R = 1;

% Define the dynamic and control matrices  P.A, P.B, P.C here

P.A = [0 0 1 0;
       0 0 0 1;
       0 P.g*P.m/P.M 0 0;
       0 (P.M*P.g + P.g*P.m)/(P.M*P.L) 0 0];
P.B = [0; 0; 1/P.M; 1/(P.M*P.L)];
P.C = [1 0 0 0;
    0 1 0 0];

% Define anything else for the controller you might need 
[P.K,~,~] = lqr(P.A,P.B,P.C'*P.Q*P.C,P.R);

% Select the controller to use
% 0 for lqr
% 1 for fully connected network trained on clean data
% 2 for fully connected network trained on noisy data
% 3 for random forest
% 4 for svm
P.controller = 1;

% change this to point to any random forest model file
randForestModelFilename = 'rand_forest_model_exp.mat';

rf = load(randForestModelFilename);
P.rf = rf.rf;

svmModelFilename = 'svm_model.mat';

svm = load(svmModelFilename);
P.svm = svm.svm;
clear rf
clear randForestModelFilename
clear svm
clear svmModelFilename
