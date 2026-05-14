clear; clc;
N = 1000000;
has_disease = rand(N, 1) < 0.01;
test_result = false(N, 1);
test_result(has_disease) = rand(sum(has_disease), 1) < 0.95;
test_result(~has_disease) = rand(sum(~has_disease), 1) < 0.05;
total_pos = sum(test_result);
true_pos = sum(test_result & has_disease);
P_simulated = true_pos / total_pos;
%Theoretical
P_d = 0.01;
P_t_on_d = 0.95;
P_t_on_nd = 0.05;
P_d_on_t = (P_t_on_d * P_d) / ((P_t_on_d * P_d) + (P_t_on_nd * (1 - P_d)));
disp('Simulated and Theoretical');
fprintf('Simulated P(D|T): %.5f\n', P_simulated);
fprintf('Theoretical P(D|T): %.5f\n', P_d_on_t);