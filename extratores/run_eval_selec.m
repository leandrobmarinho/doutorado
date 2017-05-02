clear; close all; clc; 
main_path = '../../Mestrado/code';
addpath(sprintf('%s/Exp_FEImg_ML/', main_path));
addpath(sprintf('%s/Classification/percetron/', main_path));
addpath(sprintf('%s/Classification/MLM/', main_path));
addpath(sprintf('%s/Classification/MLP/', main_path));
addpath(sprintf('%s/Classification/multisvm/', main_path));
addpath(sprintf('%s/Classification/bayes/', main_path));
addpath(sprintf('%s/utils/', main_path));
addpath(sprintf('%s/Classification/SOM_KNN/', main_path));
addpath(sprintf('%s/Classification/SOM_KNN/', main_path));
addpath(sprintf('%s/Clustering/SOM/', main_path));

% 1) nova subsecao com outros m?todos de extracao
% 	escolher o melhor classificador (SVM, MLM-NN)
% 	SOM-KNN
% 
% 2) nova subsecao com os de selecao (SVM, MLM-NN)
% 	2.1 com a base original + selecao
% 	2.2 com Var-PCA com reducao
% 	2.3 com o Var-PCA sem reduzir + selecao



%% General configurations
% {gray,h}_{extrMethod_}_{gopro,omni}_{real,sim}_{mlMethod}
conf.mlMethods = {'svmPoly', 'svmLinear', 'svmRBF', 'mlm', 'mlmNN'};
conf.numRep = 3;


%% ======= Experimentos =======
strModel = 'har_sel_%s';

% load('../data/Cfs.mat');
% conf.descr = sprintf(strModel, 'cfs');
% evaluate_ml(X, conf)
% 
% load('../data/InfoGain.mat');
% conf.descr = sprintf(strModel, 'infoGain');
% evaluate_ml(X, conf)

load('../data/wrapper.mat');
conf.descr = sprintf(strModel, 'wrapper');
evaluate_ml(X, conf)
