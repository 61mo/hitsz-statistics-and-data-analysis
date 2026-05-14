clear; clc;
N = 10000;
A = rand(1, N) < 0.9;
B = rand(1, N) < 0.8;
C = rand(1, N) < 0.85;
D = rand(1, N) < 0.95;
E = rand(1, N) < 0.7;
System = (A & B) | (C & D) | E;
simulated_reliability = mean(System);
%Theoretical
P_Branch1 = 0.9 * 0.8;
P_Branch2 = 0.85 * 0.95;
P_Branch3 = 0.7;
theoretical_reliability = 1 - ((1 - P_Branch1) * (1 - P_Branch2) * (1 - P_Branch3));
disp('Simulated Reliability and Theoretical Reliability');
fprintf('Simulated Reliability: %.5f\n', simulated_reliability);
fprintf('Theoretical Reliability: %.5f\n', theoretical_reliability);
fprintf('Absolute Difference: %.5f\n', abs(simulated_reliability - theoretical_reliability));