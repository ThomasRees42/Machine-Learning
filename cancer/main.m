clear ; close all; clc

data = load('wdbc.data');
X = data(:, [3:12]); y = data(:, 2);

plotData(X(:, 1:3), y);

[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);

[cost, grad] = costFunction(initial_theta, X, y);
fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

p = predict(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

%Ten real-valued features are computed for each cell nucleus:
%
%	a) radius (mean of distances from center to points on the perimeter)
%	b) texture (standard deviation of gray-scale values)
%	c) perimeter
%	d) area
%	e) smoothness (local variation in radius lengths)
%	f) compactness (perimeter^2 / area - 1.0)
%	g) concavity (severity of concave portions of the contour)
%	h) concave points (number of concave portions of the contour)
%	i) symmetry 
%	j) fractal dimension ("coastline approximation" - 1)
variables = [13.54 14.36 87.46 566.3 0.09779 0.08129 0.06664 0.04781 0.1885 0.05766]
prob = sigmoid([1 variables] * theta) * 100;
fprintf('Probability of tumour being malignant is: %f\n', prob); 