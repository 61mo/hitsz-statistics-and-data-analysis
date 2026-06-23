% ==============================================================
% Experiment 3 - Task 5
% Student Fill-in Template: 1D Random Walk
% ==============================================================
% Fill in every ______ before running this script.

% --- Initialization ---
clear;
clc;
close all;

% --- Step 1: Setup Simulation Parameters ---
num_people = 1000;        % Hint: 1000
num_steps = 1000;         % Hint: 1000

% --- Step 2: Generate Coin Flips ---
% Convert random numbers into +1 and -1:
% rand(...) > 0.5 gives 1 for Heads and 0 for Tails.
% 2 * result - 1 converts 1 to +1 and 0 to -1.
steps = 2 * (rand(num_people, num_steps) > 0.5) - 1;

% --- Step 3: Calculate Bank Account Balances ---
% cumsum(..., 2) adds results horizontally across time.
positions = cumsum(steps, 2);

% --- Step 4: Calculate Mean and Variance at Each Step ---
mean_pos = mean(positions, 1);
var_pos = var(positions, 0, 1);

% --- Step 5: Print Final Results ---
fprintf('--- Results after %d Steps ---\n', num_steps);
fprintf('Final Sample Mean     : %.2f (Theory says 0)\n', mean_pos(end));
fprintf('Final Sample Variance : %.2f (Theory says %d)\n', var_pos(end), num_steps);

% --- Step 6: Visualize the Random Walk ---
figure;

% Top chart: plot the paths of the first 50 people.
subplot(2, 1, 1);
plot(1:num_steps, positions(1:50, :), 'Color', [0.7 0.7 0.7]);
hold on;

% Plot the average path using a thick red line.
plot(1:num_steps, mean_pos, 'r', 'LineWidth', 2);
title('Paths of 50 People & The Average Path');
xlabel('Time (Number of Games)');
ylabel('Profit ($)');
grid on;

% Bottom chart: actual variance and theoretical variance.
subplot(2, 1, 2);
plot(1:num_steps, var_pos, 'b', 'LineWidth', 2);
hold on;

% Theoretical variance of a fair random walk is Var = Time.
plot(1:num_steps, 1:num_steps, 'k--', 'LineWidth', 2);
title('Variance vs. Time');
xlabel('Time (Number of Games)');
ylabel('Variance');
legend('Actual Sample Variance', 'Theoretical Variance', 'Location', 'northwest');
grid on;

% Question for report:
% The red average line is near 0. Does this mean one player is safe?
% Explain using the idea of variance.
