% ==============================================================
% Experiment 3 - Task 4
% Student Fill-in Template: The St. Petersburg Paradox
% ==============================================================
% Fill in every ______ before running this script.

% --- Initialization ---
clear;
clc;
close all;

% --- Step 1: Simulate the Game ---
% Repeat the game many times.
N = 100000;                 % Hint: 100000
payoffs = zeros(1, N);           % Hint: zeros(1, N)

for i = 1:N
    % k is the number of flips until the first Head appears.
    k = 1;

    % rand() < 0.5 represents Tails.
    % Keep flipping while the result is Tails.
    while rand() < 0.5
        k = k + 1;
    end

    % If the first Head appears on the k-th flip, payoff is 2^k.
    payoffs(i) = 2 ^ k;
end

% --- Step 2: Calculate Cumulative Statistics ---
n_idx = 1:N;             % Hint: 1:N

% Cumulative mean: average payoff up to game i.
cum_mean = cumsum(payoffs) ./ n_idx;

% Cumulative variance:
% Use Var(X) = E(X^2) - [E(X)]^2.
cum_var = cumsum(payoffs .^ 2) ./ n_idx - cum_mean .^ 2;

% --- Step 3: Print Results ---
fprintf('--- Results after %d Games ---\n', N);
fprintf('Final Sample Mean    : %.2f\n', cum_mean(end));
fprintf('Final Sample Variance: %.2f\n', cum_var(end));
fprintf('Highest Prize Won    : %d\n', max(payoffs));

% --- Step 4: Visualize the Paradox ---
figure;

subplot(2, 1, 1);
plot(n_idx, cum_mean, 'LineWidth', 1.5);
title('Cumulative Sample Mean');
xlabel('Number of Games');
ylabel('Average Profit ($)');
grid on;

subplot(2, 1, 2);
plot(n_idx, cum_var, 'r', 'LineWidth', 1.5);
title('Cumulative Sample Variance');
xlabel('Number of Games');
ylabel('Variance');
grid on;

% Question for report:
% If a casino asks you to pay $20 to play this game once,
% would you accept? Use your final sample mean to explain.