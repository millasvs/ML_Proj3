%% Initialization
clear ; close all; clc

%% ========= Email Preprocessing & feature extraction ==========
%  convert each email into a vector of features in R^n, where 
%  n is the number of words in the vocabulary list.
%  this can take a while if you are processing a large number
%  of emails.

X = zeros(1, 1899); % the vocabulary list, found in vocab.txt, has 1899 words

% doing feature extraction in all non-spam emails
files = dir('../easy_ham/*');
for file = files'
    full_name     = strcat('../easy_ham/',  file.name)
    file_contents = readFile(full_name);
    word_indices  = processEmail(file_contents);
    features      = emailFeatures(word_indices);
    X = [X ; features'];
end

X = X(2:end, :); % Removing first, empty, row

files = dir('../hard_ham/*');
for file = files'
    full_name     = strcat('../hard_ham/',  file.name)
    file_contents = readFile(full_name);
    word_indices  = processEmail(file_contents);
    features      = emailFeatures(word_indices);
    X = [X ; features'];
end

y = zeros(size(X, 1), 1);
old_size = size(X, 1);

% doing feature extraction in all spam emails
files = dir('../spam/*');
for file = files'
    full_name = strcat('../spam/',  file.name)
    file_contents = readFile(full_name);
    word_indices  = processEmail(file_contents);
    features      = emailFeatures(word_indices);
    X = [X ; features'];
end

y = [y ; ones(size(X, 1) - old_size, 1)];

% split into training, cross validation and test set
[X_train y_train X_cv y_cv X_test y_test] = split_training_set(X, y);

%% save the data sets in mat files to be used in main.m
save('spamTrainSet.mat','X_train', 'y_train');
save('spamValSet.mat','X_cv', 'y_cv');
save('spamTestSet.mat','X_test', 'y_test');

% Print Stats
fprintf('Length of feature vector: %d\n', length(features));
fprintf('Number of non-zero entries: %d\n', sum(features > 0));

fprintf('Program paused. Press enter to continue.\n');
pause;
