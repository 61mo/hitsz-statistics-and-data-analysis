% ==============================================================
% Experiment 3 - Task 2
% Student Fill-in Template: Probability Distribution and Riemann Sum
% ==============================================================
% Fill in every ______ before running this script.

% --- Initialization ---
clear;
clc;
close all;

% --- Theoretical Parameters ---
% The target population is a normal distribution with mean 10
% and standard deviation 2.
mu_true = 10;
sigma_true = 2;

% Compare different sample sizes and different numbers of bins.
N_values = [100000, 1000000];       % Hint: 100000 and 1000000
Bin_values = [10, 100];     % Hint: 10 and 100

figure;
plot_idx = 1;

% --- Outer Loop: Change Sample Size ---
for i = 1:length(N_values)
    N = N_values(i);

    % Generate normal-distribution data.
    % Formula: data = mu + sigma * standard_normal_samples
    data = mu_true + sigma_true * randn(1,N);

    % Calculate actual sample mean.
    actual_sample_mean = mean(data);

    fprintf('\n=================================================\n');
    fprintf(' EXPERIMENT GROUP: Sample Size N = %d\n', N);
    fprintf('=================================================\n');
    fprintf('Theoretical Mean     : %.6f\n', mu_true);
    fprintf('Actual Sample Mean   : %.6f\n\n', actual_sample_mean);

    % --- Inner Loop: Change Number of Bins ---
    for j = 1:length(Bin_values)
        num_bins = Bin_values(j);

        % Step 1: Draw probability density histogram.
        subplot(2, 2, plot_idx);
        h = histogram(data, num_bins, 'Normalization', 'pdf');
        title(sprintf('N = %d, Bins = %d', N, num_bins));
        xlabel('X Value');
        ylabel('Probability Density f(x)');
        plot_idx = plot_idx + 1;

        % Step 2: Extract histogram information.
        % dx is the width of each bar.
        dx = h.BinWidth;

        % centers are the center x-coordinates of the bars.
        centers = (h.BinEdges(1:end-1) + h.BinEdges(2:end)) / 2;

        % areas are the probability areas of all bars.
        % Since h.Values are density heights, area = height * width.
        areas = h.Values * dx;

        % Step 3: Approximate expected value by Riemann sum.
        % Formula: E(X) approximately equals sum(center * area)
        riemann_sum = sum(centers .* areas);

        % Step 4: Calculate error from actual sample mean.
        error_from_sample = riemann_sum - actual_sample_mean;
        error_from_theory = riemann_sum - mu_true;

        fprintf('  --- Bins = %d (Width dx = %.4f) ---\n', num_bins, dx);
        fprintf('  Riemann Sum Result       : %.6f\n', riemann_sum);
        fprintf('  Error from Sample Mean   : %.6f\n', error_from_sample);
        fprintf('  Error from Theory Mean   : %.6f\n\n', error_from_theory);
    end
end

% Questions for report:
% 1. Does a larger N usually make the sample mean closer to mu_true?
% 2. How does changing the number of bins affect the Riemann sum result?