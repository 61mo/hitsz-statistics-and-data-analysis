% Task 1: Population Generation and Sample Statistics
run(fullfile(fileparts(mfilename('fullpath')), 'common_setup.m'));

% Sample size
n = 30;

% Number of repeated samples
M = 5;

% Plot the histogram of the population
figure;
histogram(population, 'Normalization', 'pdf');
title('Task 1: Histogram of the Population');
xlabel('Weekly Mobile Phone Usage Time (hours)');
ylabel('Density');
grid on;

% Create an array to store sample statistics
% Columns: sample mean, sample median, sample variance, sample standard deviation
sample_statistics = zeros(M, 4);

for i = 1:M
    % Hint: generate n random integer indices from 1 to N.
    idx = randi(N, n, 1);

    % Hint: use the indices to sample from population.
    sample = population(idx);

    % Compute sample statistics
    % Hint: compute the sample mean.
    sample_mean = mean(sample);

    % Hint: compute the sample median.
    sample_median = median(sample);

    % Hint: compute the sample variance.
    sample_variance = var(sample);

    % Hint: compute the sample standard deviation.
    sample_std = std(sample);

    % Store the results
    sample_statistics(i, :) = [sample_mean, sample_median, sample_variance, sample_std];
end

% Display the sample statistics table
Task1_Table = array2table(sample_statistics, ...
    'VariableNames', {'Sample_Mean', 'Sample_Median', 'Sample_Variance', 'Sample_Std'}, ...
    'RowNames', {'Trial_1', 'Trial_2', 'Trial_3', 'Trial_4', 'Trial_5'});

disp('Task 1 Sample Statistics:');
disp(Task1_Table);
disp(['Theoretical population mean mu_X = ', num2str(mu_X)]);
