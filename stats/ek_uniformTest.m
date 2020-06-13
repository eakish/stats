
% test for uniformity of the distribution of a data set
% ek 4.21.20

x = expPhase.call';
[a, b] = unifit(x);

x2 = [min(x) : max(x)];
y = unifpdf(x2, a, b) * 10000;

figure; nhist(x); hold on; plot(x2, y, 'r')

pd = makedist('Uniform', 'lower', a, 'upper', b);

[h, p] = chi2gof(x, 'CDF', pd)