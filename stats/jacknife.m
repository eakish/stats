function [sd, confInt] = jacknife(X) % receive vector of 1's and 0's?
    d_JK = [];
    for i = 1 : 100
        leaveOut = randi(length(X), 1, 1);
        X_JK = [X(1 : leaveOut - 1)' X(leaveOut + 1 : end)']; % is this right?
        d_JK = [d_JK mean(X_JK)];
    end
    sd = std(d_JK);
    % 95th percentile (2.5% below mean, 2.5% above mean)
    confInt = [prctile(d_JK, 2.5), prctile(d_JK, 97.5)];
end