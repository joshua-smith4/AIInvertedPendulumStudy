function [x,u] = loadData(t)
    switch t
        case 0
            x_train1 = load('x_train1');
            u_train1 = load('u_train1');
            x = x_train1.x.data';
            u = u_train1.u.data';
        case 1
            x_train2 = load('x_train2');
            u_train2 = load('u_train2');
            x = x_train2.x.data';
            u = u_train2.u.data';
        case 2
            x_train1 = load('x_train1');
            u_train1 = load('u_train1');
            x_train2 = load('x_train2');
            u_train2 = load('u_train2');
            x = [x_train1.x.data' x_train2.x.data'];
            u = [u_train1.u.data' u_train2.u.data'];
    end
end