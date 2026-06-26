% Experiment 4: Random Sampling, Sampling Distributions, and Statistical Inference
clear; clc; close all;

% Parameters of the underlying normal distribution
mu = 1.5;
sigma = 0.5;

% Population size
N = 100000;

% Generate a lognormal population
population = exp(mu + sigma * randn(N, 1));

% Theoretical population mean and standard deviation
mu_X = exp(mu + sigma^2 / 2);
sigma_X = sqrt((exp(sigma^2) - 1) * exp(2*mu + sigma^2));

% Display theoretical values
disp(['Theoretical population mean mu_X = ', num2str(mu_X)]);
disp(['Theoretical population standard deviation sigma_X = ', num2str(sigma_X)]);

% Parameters of the first normal group
mu1 = 3;
sigma1 = 0.5;

% Parameters of the second normal group
mu2 = 8;
sigma2 = 0.8;

% Generate a bimodal population
% Generate two normal groups, each with N/2 observations
group1 = mu1 + sigma1 * randn(N/2, 1);
group2 = mu2 + sigma2 * randn(N/2, 1);
bimodal_population = [group1; group2];

% Population mean and standard deviation of the bimodal population
bimodal_mu_X = mean(bimodal_population);
bimodal_sigma_X = std(bimodal_population);
