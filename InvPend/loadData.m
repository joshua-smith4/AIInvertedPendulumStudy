function [x,u] = loadData(t)
    switch t
        case 0
            x_clean = load('x_clean');
            u_clean = load('u_clean');
            x = x_clean.x.data';
            u = u_clean.u.data';
        case 1
            x_noisy = load('x_noisy');
            u_noisy = load('u_noisy');
            x = x_noisy.x.data';
            u = u_noisy.u.data';
    end
end