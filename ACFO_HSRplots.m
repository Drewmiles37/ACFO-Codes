close all;
clear all;

% Load the Excel file and specify the sheet name
filePath = 'ACFO_FitTests.xlsx'; % Change this to your actual file
sheetName = 'Master'; % Change this to the sheet you want

% Read specific column ranges and rows from the Excel sheet
table1 = readmatrix(filePath, 'Sheet', sheetName, 'Range', 'A2:G11');
table2 = readmatrix(filePath, 'Sheet', sheetName, 'Range', 'I2:O11');

% Read column labels (assuming they are in row 1 for both tables)
columnLabels1 = readcell(filePath, 'Sheet', sheetName, 'Range', 'A1:G1');
columnLabels2 = readcell(filePath, 'Sheet', sheetName, 'Range', 'I1:O1');

% Read the 12th row for averages (assumed to be the last row of the table)
avgRow1 = readmatrix(filePath, 'Sheet', sheetName, 'Range', 'A12:G12');
avgRow2 = readmatrix(filePath, 'Sheet', sheetName, 'Range', 'I12:O12');

% Function to plot histogram and shaded distribution curve
function plot_hist_and_shaded_distribution(data, label, tableName)
    figure;
    
    % Histogram (without changing binning)
    histogram(data, 'Normalization', 'pdf', 'FaceColor', 'b', 'FaceAlpha', 0.6);
    hold on;
    
    % Calculate mean and standard deviation
    mu = mean(data);
    sigma = std(data);
    
    % Plot normal distribution curve, ensuring no negative values
    x = linspace(0, max(data)+1, 100); % Set range to be >= 0
    y = (1 / (sigma * sqrt(2 * pi))) * exp(-0.5 * ((x - mu) / sigma) .^ 2);
    plot(x, y, 'r', 'LineWidth', 2);

    % Shaded region for ±1 standard deviation
    x_fill = linspace(mu - sigma, mu + sigma, 100);
    y_fill = (1 / (sigma * sqrt(2 * pi))) * exp(-0.5 * ((x_fill - mu) / sigma) .^ 2);
    fill([x_fill, fliplr(x_fill)], [y_fill, zeros(size(y_fill))], 'g', 'FaceAlpha', 0.3, 'EdgeColor', 'none');
    
    % Plot standard deviation lines
    xline(mu, '--k', 'Mean', 'LineWidth', 1.5);
    xline(mu - sigma, ':g', '-1 Std Dev', 'LineWidth', 1.5);
    xline(mu + sigma, ':g', '+1 Std Dev', 'LineWidth', 1.5);

    % Labels and title
    xlabel('Values');
    ylabel('Probability Density');
    title([tableName, ' - ', label]); % Include table name and label in title
    legend('Histogram', 'Normal Distribution', 'Std Dev Region', 'Location', 'Best');
    
    hold off;
end

% Function to create scatter plot with whiskers
function plot_scatter_with_whiskers(averages, std_devs, labels, tableName)
    figure;
    
    % Scatter plot for averages (mean values)
    scatter(1:length(averages), averages, 'filled', 'MarkerFaceColor', 'b');
    hold on;
    
    % Add whiskers for standard deviation
    for i = 1:length(averages)
        % Whiskers extend ±1 standard deviation
        line([i, i], [averages(i) - std_devs(i), averages(i) + std_devs(i)], 'Color', 'r', 'LineWidth', 2);
    end
    
    % Set x-ticks to labels
    set(gca, 'XTick', 1:length(labels), 'XTickLabel', labels, 'XTickLabelRotation', 45);
    
    % Labels and title
    ylabel('Measurement');
    title([tableName, ' - Averages with Standard Deviation']);
    
    hold off;
end

% Loop through each column and plot for Table 1 (excluding column A)
[numRows, numCols] = size(table1);
for col = 2:numCols % Start from column 2 to exclude A
    col_data = table1(:, col);
    col_data = col_data(~isnan(col_data)); % Remove NaNs
    
    % Get the label for this column
    label = columnLabels1{1, col};
    
    % Plot for Table 1
    plot_hist_and_shaded_distribution(col_data, label, 'Table 1');
end

% Loop through each column and plot for Table 2 (excluding column I)
[numRows, numCols] = size(table2);
for col = 2:numCols % Start from column 2 to exclude I
    col_data = table2(:, col);
    col_data = col_data(~isnan(col_data)); % Remove NaNs
    
    % Get the label for this column
    label = columnLabels2{1, col};
    
    % Plot for Table 2
    plot_hist_and_shaded_distribution(col_data, label, 'Table 2');
end

% Create scatter plot with whiskers for Table 1 averages
std_devs1 = std(table1, 0, 1); % Standard deviation for Table 1 (columns)
plot_scatter_with_whiskers(avgRow1, std_devs1, columnLabels1(1:end), 'Table 1');
ylabel("Offset (mm)");
title("3 View Average")
% Create scatter plot with whiskers for Table 2 averages
std_devs2 = std(table2, 0, 1); % Standard deviation for Table 2 (columns)
plot_scatter_with_whiskers(avgRow2, std_devs2, columnLabels2(1:end), 'Table 2');
ylabel("Offset (mm)");
title("1 View Average")
