function u = controller(x,P)
% x are the states
% P is the structure from param 
% u is the scalar output from the controller
% Add Controller Code Here
% [y,~,~] = netSimpleFunc2(x);
switch P.controller
    case 0
        u = -P.K*x;
    case 1
        u = fc_net(x);
    case 2
        u = fc_noisy(x);
    case 3
        u = predict(P.rf, x');
    case 4
        u = predict(P.svm, x');
end
end