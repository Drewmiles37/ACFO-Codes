close all;
clear all;

% Specify the Excel file name
excel1 = 'Automation_proj_data1.xlsx';
% Number of Monte Carlo samples
num_samples = 4000;
% Number of trendlines to plot
num_trendlines = 20;
% Polyfit order
n = 1;

% Define colorblind-friendly colors
data_color = [0.0, 0.5, 1.0];  % Blue
trendline_color = [0.9, 0.6, 0.0];  % Orange
best_fit_color = [0.0, 0.0, 0.0];  % Black

% Function to perform Monte Carlo simulation
function [params, errors] = monte_carlo_fit(x, y, num_samples, poly_order)
    params = zeros(num_samples, poly_order + 1); % Store parameters
    errors = zeros(num_samples, 1); % Store errors
    
    for i = 1:num_samples
        % Sample data points randomly with replacement
        sample_indices = randi(length(x), length(x), 1);
        x_sample = x(sample_indices);
        y_sample = y(sample_indices);
        
        % Fit a polynomial (in this case, a linear trendline)
        p = polyfit(x_sample, y_sample, poly_order);
        params(i, :) = p;
        
        % Compute the error for this fit
        fitted_y = polyval(p, x);
        error = sum((y - fitted_y) .^ 2);
        errors(i) = error;
    end
end

%% Age
sheet1 = 'Age';
data = xlsread(excel1, sheet1);
x1 = data(:, 1);
y1 = data(:, 4);

[params_age, errors_age] = monte_carlo_fit(x1, y1, num_samples, n);

[~, min_idx] = min(errors_age);
best_params_age = params_age(min_idx, :);

figure(1)
scatter(x1, y1, 36, data_color, 'o', 'MarkerEdgeColor', data_color, 'MarkerFaceColor', 'none');
hold on;
for i = 1:num_trendlines
    trendline_age = polyval(params_age(i, :), x1);
    plot(x1, trendline_age, '-', 'Color', trendline_color, 'LineWidth', 1);
end
trendline_best_age = polyval(best_params_age, x1);
plot(x1, trendline_best_age, '-', 'Color', best_fit_color, 'LineWidth', 2);
xlabel('Fingerlength');
ylabel('Age');
title('Monte Carlo Method: Fingerlength vs Age');
grid on;

equation_text = sprintf('y = %.4fx + %.4f', best_params_age(1), best_params_age(2));
text(max(x1), min(y1), equation_text, 'FontSize', 10, 'Color', best_fit_color, ...
     'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');
hold off;

%% Height
sheet2 = 'Height';
data = xlsread(excel1, sheet2);
x2 = data(:, 1);
y2 = data(:, 4);

[params_height, errors_height] = monte_carlo_fit(x2, y2, num_samples, n);

[~, min_idx] = min(errors_height);
best_params_height = params_height(min_idx, :);

figure(2)
scatter(x2, y2, 36, data_color, 'o', 'MarkerEdgeColor', data_color, 'MarkerFaceColor', 'none');
hold on;
for i = 1:num_trendlines
    trendline_height = polyval(params_height(i, :), x2);
    plot(x2, trendline_height, '-', 'Color', trendline_color, 'LineWidth', 1);
end
trendline_best_height = polyval(best_params_height, x2);
plot(x2, trendline_best_height, '-', 'Color', best_fit_color, 'LineWidth', 2);
xlabel('Fingerlength');
ylabel('Height');
title('Monte Carlo Method: Fingerlength vs Height');
grid on;

equation_text = sprintf('y = %.4fx + %.4f', best_params_height(1), best_params_height(2));
text(max(x2), min(y2), equation_text, 'FontSize', 10, 'Color', best_fit_color, ...
     'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');
hold off;

%% Weight
sheet3 = 'Weight';
data = xlsread(excel1, sheet3);
x3 = data(:, 1);
y3 = data(:, 4);

[params_weight, errors_weight] = monte_carlo_fit(x3, y3, num_samples, n);

[~, min_idx] = min(errors_weight);
best_params_weight = params_weight(min_idx, :);

figure(3)
scatter(x3, y3, 36, data_color, 'o', 'MarkerEdgeColor', data_color, 'MarkerFaceColor', 'none');
hold on;
for i = 1:num_trendlines
    trendline_weight = polyval(params_weight(i, :), x3);
    plot(x3, trendline_weight, '-', 'Color', trendline_color, 'LineWidth', 1);
end
trendline_best_weight = polyval(best_params_weight, x3);
plot(x3, trendline_best_weight, '-', 'Color', best_fit_color, 'LineWidth', 2);
xlabel('Fingerlength');
ylabel('Weight');
title('Monte Carlo Method: Fingerlength vs Weight');
grid on;

equation_text = sprintf('y = %.4fx + %.4f', best_params_weight(1), best_params_weight(2));
text(max(x3), min(y3), equation_text, 'FontSize', 10, 'Color', best_fit_color, ...
     'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');
hold off;
