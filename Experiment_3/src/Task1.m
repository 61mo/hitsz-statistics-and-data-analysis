% ==============================================================
% Experiment 3 - Task 1
% Student Fill-in Template: Mean and Variance
% ==============================================================
% Fill in every ______ before running this script.

% --- Initialization ---
clear;
clc;
close all;

% --- Step 1: Generate Random Data ---
% Generate N samples from the standard normal distribution.
N = 100000;
X = randn(1, N);        % Hint: use randn(1, N)

% --- Step 2: Calculate Mean Manually ---
% Formula: mean = sum(x_i) / N
mean_math = sum(X) / N;

% --- Step 3: Calculate Variance Manually ---
% Formula for sample variance:
% var = sum((x_i - mean)^2) / (N - 1)
% Hint: use .^2, not ^2, because X is an array.
var_math = sum((X - mean_math) .^ 2) / (N-1);

% --- Step 4: Use MATLAB Built-in Functions ---
mean_builtin = mean(X);    % Hint: mean(X)
var_builtin = var(X);     % Hint: var(X)

% --- Step 5: Display and Compare Results ---
disp('--- Mean of X ---');
fprintf('Manual Formula : %.4f\n', mean_math);
fprintf('MATLAB Built-in: %.4f\n\n', mean_builtin);

disp('--- Variance of X ---');
fprintf('Manual Formula : %.4f\n', var_math);
fprintf('MATLAB Built-in: %.4f\n', var_builtin);

% Question for report:
% Are mean_math and mean_builtin close to each other?
% Are var_math and var_builtin close to each other?