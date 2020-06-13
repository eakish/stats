function [sd, confInt] = bootstrap2(X, Y) % resampling with replacement
    d_Boot = [];
    XY = [X' Y'];
    for i = 1 : 100
        X_Boot = X(randi(length(XY), length(X) - 1, 1));
        Y_Boot = Y(randi(length(XY), length(Y) - 1, 1));
        d_Boot = [d_Boot mean(X_Boot) - mean(Y_Boot)];
    end
    sd = std(d_Boot);
    % 95th percentile (2.5% below mean, 2.5% above mean)
    confInt = [prctile(d_Boot, 2.5), prctile(d_Boot, 97.5)];
end