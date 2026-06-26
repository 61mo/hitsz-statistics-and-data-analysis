% Task 2: Sampling Distribution of the Sample Mean
run(fullfile(fileparts(mfilename('fullpath')), 'common_setup.m'));

% Sample size
n = 30;

% Number of sampling trials
M = 10000;

% Create an array to store the sample means
sample_means = zeros(M, 1);

for i = 1:M
    % Hint: generate n random integer indices from 1 to N.
    idx = randi(N, n, 1);

    % Hint: use the indices to sample from population.
    sample = population(idx);

    % Hint: compute and store the mean of this sample.
    sample_means(i) = mean(sample);
end

figure;
% Hint: plot the simulated sample means.
histogram(sample_means, 'Normalization', 'pdf');
hold on;

% Hint: draw a vertical line at the theoretical population mean.
xline(mu_X, 'r-', 'LineWidth', 2);

title('Task 2: Sampling Distribution of the Sample Mean');
xlabel('Sample Mean');
ylabel('Density');
legend('Empirical Sampling Distribution', 'Theoretical Population Mean');
grid on;
hold off;

% Hint: compute the average of all simulated sample means.
mean_of_sample_means = mean(sample_means);

% Display results
disp('Task 2 Results:');
disp(['Theoretical population mean mu_X = ', num2str(mu_X)]);
disp(['Mean of the simulated sample means = ', num2str(mean_of_sample_means)]);
