function u = controller(x,P)
% x are the states
% P is the structure from param 
% u is the scalar output from the controller
% Add Controller Code Here

switch P.controller
    case 0
        u = -P.K*x;
    case 1
        u = fc_net(x);
    case 2
        u = fc_noisy(x);
    case 3
        u = predict(P.rf1, x');
    case 4
        u = predict(P.rf2, x');
    case 5
        u = predict(P.svm, x');
end
end