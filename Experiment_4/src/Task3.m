% Task 3: Effect of Sample Size, Population Shape, and the Central Limit Theorem
run(fullfile(fileparts(mfilename('fullpath')), 'common_setup.m'));

% Store the three sample sizes in an array
n_values = [5, 30, 100];

% Number of sampling trials
M = 10000;

%% Part 1: Lognormal Population

% Create arrays to store comparison results for the lognormal population
lognormal_simulated_sd = zeros(length(n_values), 1);
lognormal_theoretical_se = zeros(length(n_values), 1);

figure;

% Use an outer loop to go through the three sample sizes
for j = 1:length(n_values)
    n = n_values(j);

    % Create an array to store sample means
    sample_means = zeros(M, 1);

    % Repeat the sampling process M times
    for i = 1:M
        idx = randi(N, n, 1);
        sample = population(idx);

        % Hint: compute and store the mean of this sample.
        sample_means(i) = mean(sample);
    end

    % Hint: compute the standard deviation of the simulated sample means.
    lognormal_simulated_sd(j) = std(sample_means);

    % Hint: use the formula sigma_X / sqrt(n).
    lognormal_theoretical_se(j) = sigma_X / sqrt(n);

    % Plot the histogram of sample means
    subplot(3, 1, j);
    histogram(sample_means, 'Normalization', 'pdf');
    hold on;

    % Generate x-axis values for the normal density curve
    x = linspace(mu_X - 4 * lognormal_theoretical_se(j), ...
        mu_X + 4 * lognormal_theoretical_se(j), 200);

    % Hint: use the normal density formula with mean mu_X and standard error lognormal_theoretical_se(j).
    y = 1./(lognormal_theoretical_se(j) * sqrt(2*pi)) .* ...
        exp(-0.5 * ((x - mu_X) ./ lognormal_theoretical_se(j)) .^ 2);

    % Plot the normal density curve
    plot(x, y, 'r-', 'LineWidth', 2);

    title(['Lognormal Population, n = ', num2str(n)]);
    xlabel('Sample Mean');
    ylabel('Density');
    legend('Empirical Distribution', 'Normal Density Curve');
    grid on;
    hold off;
end

%% Part 2: Bimodal Population

% Hint: compute the mean of the bimodal population.
bimodal_mu_X = mean(bimodal_population);
% Hint: compute the standard deviation of the bimodal population.
bimodal_sigma_X = std(bimodal_population);

% Create arrays to store comparison results for the bimodal population
bimodal_simulated_sd = zeros(length(n_values), 1);
bimodal_theoretical_se = zeros(length(n_values), 1);

figure;

% Use the same outer loop structure for the bimodal population
for j = 1:length(n_values)
    n = n_values(j);

    % Create an array to store sample means
    sample_means = zeros(M, 1);

    % Repeat the sampling process M times
    for i = 1:M
        idx = randi(N, n, 1);
        sample = bimodal_population(idx);

        % Hint: compute and store the mean of this sample.
        sample_means(i) = mean(sample);
    end

    % Hint: compute the standard deviation of the simulated sample means.
    bimodal_simulated_sd(j) = std(sample_means);

    % Hint: use the formula bimodal_sigma_X / sqrt(n).
    bimodal_theoretical_se(j) = bimodal_sigma_X / sqrt(n);

    % Plot the histogram of sample means
    subplot(3, 1, j);
    histogram(sample_means, 'Normalization', 'pdf');
    hold on;

    % Generate x-axis values for the normal density curve
    x = linspace(bimodal_mu_X - 4*bimodal_theoretical_se(j), ...
        bimodal_mu_X + 4*bimodal_theoretical_se(j), 200);

    % Hint: use the normal density formula with mean bimodal_mu_X and standard error bimodal_theoretical_se(j).
    y = 1./(bimodal_theoretical_se(j) * sqrt(2*pi)) .* ...
        exp(-0.5 * ((x - bimodal_mu_X) ./ bimodal_theoretical_se(j)) .^ 2);

    % Plot the normal density curve
    plot(x, y, 'r-', 'LineWidth', 2);

    title(['Bimodal Population, n = ', num2str(n)]);
    xlabel('Sample Mean');
    ylabel('Density');
    legend('Empirical Distribution', 'Normal Density Curve');
    grid on;
    hold off;
end

%% Display the comparison table

Population_Type = {'Lognormal'; 'Lognormal'; 'Lognormal'; ...
    'Bimodal'; 'Bimodal'; 'Bimodal'};

Sample_Size_n = [n_values'; n_values'];

Simulated_SD = [lognormal_simulated_sd; bimodal_simulated_sd];

Theoretical_SE = [lognormal_theoretical_se; bimodal_theoretical_se];

Task3_Table = table(Population_Type, Sample_Size_n, Simulated_SD, Theoretical_SE);

disp('Task 3 Comparison Table:');
disp(Task3_Table);
