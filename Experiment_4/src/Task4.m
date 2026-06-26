% Task 4: Population Mean Inference Using Confidence Intervals
run(fullfile(fileparts(mfilename('fullpath')), 'common_setup.m'));

% Sample size
n = 30;

% Number of trials
M = 100000;

% Count the number of intervals containing mu_X
coverage_count = 0;

% Hint: compute the 95% margin of error: 1.96 * sigma_X / sqrt(n).
margin_error = 1.96 * sigma_X / sqrt(n);

% Generate one example confidence interval
idx = randi(N, n, 1);
sample = population(idx);

% Hint: compute the sample mean.
x_bar = mean(sample);

% Hint: construct the lower bound of the confidence interval.
lower_bound = x_bar - margin_error;

% Hint: construct the upper bound of the confidence interval.
upper_bound = x_bar + margin_error;

% Store the example confidence interval
example_sample_mean = x_bar;
example_lower_bound = lower_bound;
example_upper_bound = upper_bound;

% Repeat the process M times
for i = 1:M
    % Random sampling with replacement
    idx = randi(N, n, 1);
    sample = population(idx);

    % Compute the sample mean
    x_bar = mean(sample);

    % Construct the confidence interval
    lower_bound = x_bar - margin_error;
    upper_bound = x_bar + margin_error;

    % Hint: check whether mu_X is inside the confidence interval.
    if (mu_X >= lower_bound) && (mu_X <= upper_bound)
        coverage_count = coverage_count + 1;
    end
end

% Hint: compute the proportion of intervals that contain mu_X.
coverage_probability = coverage_count / M;

% Display results
disp('Task 4 Example 95% Confidence Interval:');
disp(['Sample mean = ', num2str(example_sample_mean)]);
disp(['Lower bound = ', num2str(example_lower_bound)]);
disp(['Upper bound = ', num2str(example_upper_bound)]);
disp(['Theoretical population mean mu_X = ', num2str(mu_X)]);

disp('Task 4 Simulated Coverage Probability:');
disp(['Number of trials M = ', num2str(M)]);
disp(['Number of intervals containing mu_X = ', num2str(coverage_count)]);
disp(['Simulated coverage probability = ', num2str(coverage_probability)]);
