function [X_norm, mu, sigma] = featureNormalize(X)

mu = mean(X);
sigma = std(X);
if sigma == 0,
  sigma = 1;
end
X_norm = (X - mu) ./ sigma;

end