% ==============================================================
% Experiment 3 - Task 3
% Student Fill-in Template: Covariance and Linear Combinations
% ==============================================================
% Fill in every ______ before running this script.

% --- Initialization ---
clear;
clc;
close all;

% --- Step 1: Generate Correlated Data ---
N = 10000;

% Generate two independent standard normal variables.
X = randn(1, N);
Z = randn(1, N);

% Create Y by mixing X and Z.
% This makes Y correlated with X.
Y = 0.8 * X + 0.2 * Z;       % Hint: 0.8*X + 0.2*Z

% Create W = aX + bY.
a = 2;
b = 3;
W = a * X + b * Y;

% --- Step 2: Extract Covariance ---
% cov(X, Y) returns a 2-by-2 covariance matrix.
cov_matrix = cov(X, Y);
cov_builtin = cov_matrix(1, 2);     % Hint: row 1, column 2

% --- Step 3: Verify Mean Property ---
% Formula: E(W) = aE(X) + bE(Y)
actual_mean_W = mean(W);
theory_mean_W = a * mean(X) + b * mean(Y);

% --- Step 4: Verify Variance Property ---
% Actual variance from data:
actual_var_W = var(W);

var_X = var(X);
var_Y = var(Y);

% Correct formula:
% Var(aX + bY) = a^2 Var(X) + b^2 Var(Y) + 2ab Cov(X,Y)
var_correct = a ^ 2 * var_X + b ^ 2 * var_Y + 2 * a * b * cov_builtin;

% Wrong formula:
% This ignores covariance and should not match well when X and Y are related.
var_wrong = a ^ 2 * var_X + b ^ 2 * var_Y;

% --- Step 5: Display Results ---
disp('--- 1. Mean Property Verification ---');
fprintf('Actual Mean E(W)     : %.4f\n', actual_mean_W);
fprintf('Theory aE(X) + bE(Y) : %.4f\n\n', theory_mean_W);

disp('--- 2. Variance Property Verification ---');
fprintf('Covariance Cov(X,Y)       : %.4f\n', cov_builtin);
fprintf('Actual Variance Var(W)    : %.4f\n', actual_var_W);
fprintf('Correct Formula (With Cov): %.4f\n', var_correct);
fprintf('Wrong Formula (No Cov)    : %.4f\n\n', var_wrong);

disp('--- Error Analysis ---');
fprintf('Error caused by ignoring Covariance: %.4f\n', abs(actual_var_W - var_wrong));

% Question for report:
% Why must covariance be included when X and Y are correlated?