close all;
clear all;

% Specify the Excel file name
excel1 = 'Automation_proj_data1.xlsx';

%% Age
% Specify the sheet name
sheet1 = 'Age'; % Change 'Sheet1' to the name of your sheet
% Read data from Excel file
data = xlsread(excel1, sheet1);
% Extract x and y data from the columns (assuming x is in the first column and y is in the second column)
x1 = data(:, 1);
y1 = data(:, 4);
% Plot the data
figure(1)
scatter(x1, y1, 'b.');
hold on;
% Calculate Pearson correlation coefficient
r1 = corr(x1, y1);
% Plot confidence ellipse
confidence = 0.95; % Set confidence level
std_x1 = std(x1); % Standard deviation of x
std_y1 = std(y1); % Standard deviation of y
n1 = length(x1); % Number of data points
t1 = tinv((1 + confidence) / 2, n1 - 2); % t-score for confidence interval
ellipse_x1 = std_x1 * t1; % Semi-major axis length
ellipse_y1 = std_y1 * t1; % Semi-minor axis length
mu_x1 = mean(x1); % Mean of x
mu_y1 = mean(y1); % Mean of y
theta1 = atan(r1 * std_y1 / std_x1); % Angle of rotation
% Parametric equations of the ellipse
t = linspace(0, 2*pi, 100);
X1 = mu_x1 + ellipse_x1 * cos(t) * cos(theta1) - ellipse_y1 * sin(t) * sin(theta1);
Y1 = mu_y1 + ellipse_x1 * cos(t) * sin(theta1) + ellipse_y1 * sin(t) * cos(theta1);
% Plot the ellipse
plot(X1, Y1, 'r', 'LineWidth', 2);
text(0.1, 0.9, sprintf('Pearson Correlation Coefficient: %.4f', r1), 'Units', 'normalized', 'FontSize', 10); % Add correlation coefficient to plot
ylabel('Fingerlength (mm)');
xlabel('Age (yr)');
title('Fingerlength vs Age');
grid on;
hold off; % Release the plot hold

%% Height
sheet2 = 'Height'; % Change 'Sheet1' to the name of your sheet
% Read data from Excel file
data = xlsread(excel1, sheet2);
% Extract x and y data from the columns (assuming x is in the first column and y is in the second column)
x2 = data(:, 1);
y2 = data(:, 4);
% Plot the data
figure(2)
scatter(x2, y2, 'b.');
hold on;
% Calculate Pearson correlation coefficient
r2 = corr(x2, y2);
% Plot confidence ellipse
std_x2 = std(x2); % Standard deviation of x
std_y2 = std(y2); % Standard deviation of y
n2 = length(x2); % Number of data points
t2 = tinv((1 + confidence) / 2, n2 - 2); % t-score for confidence interval
ellipse_x2 = std_x2 * t2; % Semi-major axis length
ellipse_y2 = std_y2 * t2; % Semi-minor axis length
mu_x2 = mean(x2); % Mean of x
mu_y2 = mean(y2); % Mean of y
theta2 = atan(r2 * std_y2 / std_x2); % Angle of rotation
% Parametric equations of the ellipse
X2 = mu_x2 + ellipse_x2 * cos(t) * cos(theta2) - ellipse_y2 * sin(t) * sin(theta2);
Y2 = mu_y2 + ellipse_x2 * cos(t) * sin(theta2) + ellipse_y2 * sin(t) * cos(theta2);
% Plot the ellipse
plot(X2, Y2, 'r', 'LineWidth', 2);
text(0.1, 0.9, sprintf('Pearson Correlation Coefficient: %.4f', r2), 'Units', 'normalized', 'FontSize', 10); % Add correlation coefficient to plot
ylabel('Fingerlength (mm)');
xlabel('Height (in)');
title('Fingerlength vs Height');
grid on;
hold off; % Release the plot hold

%% Weight
% Specify the sheet name
sheet3 = 'Weight'; % Change 'Sheet1' to the name of your sheet
% Read data from Excel file
data = xlsread(excel1, sheet3);
% Extract x and y data from the columns (assuming x is in the first column and y is in the second column)
x3 = data(:, 1);
y3 = data(:, 4);
% Plot the data
figure(3)
scatter(x3, y3, 'b.');
hold on;
% Calculate Pearson correlation coefficient
r3 = corr(x3, y3);
% Plot confidence ellipse
std_x3 = std(x3); % Standard deviation of x
std_y3 = std(y3); % Standard deviation of y
n3 = length(x3); % Number of data points
t3 = tinv((1 + confidence) / 2, n3 - 2); % t-score for confidence interval
ellipse_x3 = std_x3 * t3; % Semi-major axis length
ellipse_y3 = std_y3 * t3; % Semi-minor axis length
mu_x3 = mean(x3); % Mean of x
mu_y3 = mean(y3); % Mean of y
theta3 = atan(r3 * std_y3 / std_x3); % Angle of rotation
% Parametric equations of the ellipse
X3 = mu_x3 + ellipse_x3 * cos(t) * cos(theta3) - ellipse_y3 * sin(t) * sin(theta3);
Y3 = mu_y3 + ellipse_x3 * cos(t) * sin(theta3) + ellipse_y3 * sin(t) * cos(theta3);
% Plot the ellipse
plot(X3, Y3, 'r', 'LineWidth', 2);
text(0.1, 0.9, sprintf('Pearson Correlation Coefficient: %.4f', r3), 'Units', 'normalized', 'FontSize', 10); % Add correlation coefficient to plot
ylabel('Fingerlength (mm)');
xlabel('Weight (lb)');
title('Fingerlength vs Weight');
grid on;
hold off; % Release the plot hold

% %% Race
% % Specify the sheet name
% sheet4 = 'Race'; % Change 'Sheet1' to the name of your sheet
% % Read data from Excel file
% data = xlsread(excel1, sheet4);
% % Extract x and y data from the columns (assuming x is in the first column and y is in the second column)
% x4 = data(:, 1);
% y4 = data(:, 4);
% % Plot the data
% figure(4)
% scatter(x4, y4, 'b.');
% hold on;
% % Calculate Pearson correlation coefficient
% r4 = corr(x4, y4);
% % Plot confidence ellipse
% std_x4 = std(x4); % Standard deviation of x
% std_y4 = std(y4); % Standard deviation of y
% n4 = length(x4); % Number of data points
% t4 = tinv((1 + confidence) / 2, n4 - 2); % t-score for confidence interval
% ellipse_x4 = std_x4 * t4; % Semi-major axis length
% ellipse_y4 = std_y4 * t4; % Semi-minor axis length
% mu_x4 = mean(x4); % Mean of x
% mu_y4 = mean(y4); % Mean of y
% theta4 = atan(r4 * std_y4 / std_x4); % Angle of rotation
% % Parametric equations of the ellipse
% X4 = mu_x4 + ellipse_x4 * cos(t) * cos(theta4) - ellipse_y4 * sin(t) * sin(theta4);
% Y4 = mu_y4 + ellipse_x4 * cos(t) * sin(theta4) + ellipse_y4 * sin(t) * cos(theta4);
% % Plot the ellipse
% plot(X4, Y4, 'r', 'LineWidth', 2);
% text(0.1, 0.9, sprintf('Pearson Correlation Coefficient: %.4f', r4), 'Units', 'normalized', 'FontSize', 10); % Add correlation coefficient to plot
% ylabel('Fingerlength');
% xlabel('Race');
% title('Fingerlength vs Race');
% grid on;
% hold off; % Release the plot hold
