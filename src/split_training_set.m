% Split the data set into a training set, 
% a cross validation set and a test set using
% the following proportions:
% training set: 60%
% cross validation set: 20%
% test set: 20%

function [X_train y_train X_cv y_cv X_test y_test] = ...
    split_training_set(X, y)
    
  % shuffle the rows of X and y
  all = [X y];
  all = all(randperm(size(all,1)),:);
  
  X = all(:, 1:size(X,2));
  y = all(:, size(X,2)+1:end);
  
  m = size(X, 1); % number of training examples
  mtrain = ceil(0.6*m);
  mcv = floor((m-mtrain)/2) + mtrain + 1;

  X_train = X(1:mtrain, :);
  X_cv = X(mtrain+1:mcv, :);
  X_test = X(mcv+1:m, :);

  y_train = y(1:mtrain, :);
  y_cv = y(mtrain+1:mcv, :);
  y_test = y(mcv+1:m, :);
    
    
end    