%Features consist of hourly average ambient variables
%- Temperature (T) in the range 1.81°C and 37.11°C,
%- Ambient Pressure (AP) in the range 992.89-1033.30 milibar,
%- Relative Humidity (RH) in the range 25.56% to 100.16%
%- Exhaust Vacuum (V) in teh range 25.36-81.56 cm Hg
%- Net hourly electrical energy output (EP) 420.26-495.76 MW
%The averages are taken from various sensors located around the plant that record the ambient variables every second. The variables are given without normalization.
clear; close all; clc

fprintf('Loading data ...\n');
data = csvread('Folds5x2_pp.csv');
X = data(2:9569, 1:4);
y = data(2:9569, 5);
m = length(y);

fprintf('Normalizing Features ...\n');
[X mu sigma] = featureNormalize(X);

X = [ones(m, 1) X];

fprintf('Running gradient descent ...\n');
alpha = 0.001;
num_iters = 10000;
theta = zeros(5, 1);

[theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters);

figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');

%=========change values here===========%
values = [20 1000 60 60];
%======================================%
scaledValues = (values - mu) ./ sigma;
price =  [1 scaledValues] * theta;
fprintf('The Net hourly electrical energy output (EP) for the provided values is %f MW.\n',price);