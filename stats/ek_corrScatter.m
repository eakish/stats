function [r_val, p_val] = ek_corrScatter(xLabel, x, yLabel, y)
% - created 4.20.20 by EK

figure
scatter(x, y, 'k')
xlabel(xLabel)
ylabel(yLabel)
set(gca, 'tickdir', 'out', 'fontsize', 15)
hold on
[r, pval] = corr(x',  y') % weak negative correlation, statistically significant
[p, S] = polyfit(x, y,1);
[f, delta] = polyval(p, x, S');
h = plot(x, f, 'r');
label(h, strcat('r = ', num2str(r), ' p = ', num2str(pval)), 'location', 'west', 'fontsize', 11, 'fontweight', 'bold')