%% This code was made by Drew Miles
close all;
clear all;

% Specify the Excel file name
excel1 = 'Automation_proj_data1.xlsx';
% Polyfit order
n = 1;
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
% Fit a polynomial (in this case, a linear trendline)
p1 = polyfit(x1, y1, n);
% Generate y values for the trendline
trendline1 = polyval(p1, x1);
% Plot the trendline on top of the scatter plot
plot(x1, trendline1, 'r-', 'LineWidth', 2);
ylabel('Fingerlength (mm)');
xlabel('Age (yr)');
title('Fingerlength vs Age');
grid on;
% Output the polynomial equation
fprintf('The polynomial equation for Age is: y = %.4fx + %.4f\n', p1(1), p1(2));
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
% Fit a polynomial (in this case, a linear trendline)
p2 = polyfit(x2, y2, n);
% Generate y values for the trendline
trendline2 = polyval(p2, x2);
% Plot the trendline on top of the scatter plot
plot(x2, trendline2, 'r-', 'LineWidth', 2);
ylabel('Fingerlength (mm)');
xlabel('Height (in)');
title('Fingerlength vs Height');
grid on;
% Output the polynomial equation
fprintf('The polynomial equation for Height is: y = %.4fx + %.4f\n', p2(1), p2(2));
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
% Fit a polynomial (in this case, a linear trendline)
p3 = polyfit(x3, y3, n);
% Generate y values for the trendline
trendline3 = polyval(p3, x3);
% Plot the trendline on top of the scatter plot
plot(x3, trendline3, 'r-', 'LineWidth', 2);
ylabel('Fingerlength (mm)');
xlabel('Weight (lb)');
title('Fingerlength vs Weight');
grid on;
% Output the polynomial equation
fprintf('The polynomial equation for Weight is: y = %.4fx + %.4f\n', p3(1), p3(2));
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
% % Fit a polynomial (in this case, a linear trendline)
% p4 = polyfit(x4, y4, n);
% % Generate y values for the trendline
% trendline4 = polyval(p4, x4);
% % Plot the trendline on top of the scatter plot
% plot(x4, trendline4, 'r-', 'LineWidth', 2);
% ylabel('Fingerlength');
% xlabel('Race');
% title('Fingerlength vs Race');
% grid on;
% % Output the polynomial equation
% fprintf('The polynomial equation for Race is: y = %.4fx + %.4f\n', p4(1), p4(2));
% hold off; % Release the plot hold