function [J, grad] = costFunction(theta, X, y)

m = length(y); 

hypothesis = sigmoid(X * theta);
J = (1 / m) * sum(-y .* log(hypothesis) - (1 - y) .* log(1 - hypothesis));
grad = (1 / m) * sum((hypothesis - y) .* X);

end