function [sd, confInt, d_Boot] = ek_bootstrap(X) % resampling with replacement
    d_Boot = [];
    for i = 1 : 1000
        X_Boot = X(randi(length(X), length(X)));
        d_Boot = [d_Boot mean(X_Boot)];
    end
    sd = std(d_Boot);
    % 95th percentile (2.5% below mean, 2.5% above mean)
    confInt = [prctile(d_Boot, 2.5), prctile(d_Boot, 97.5)];
end