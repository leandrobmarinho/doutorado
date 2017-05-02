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

%% Carrega os dados extraidos
load('../data/data_ext_har.mat');



%% General configurations
% {gray,h}_{extrMethod_}_{gopro,omni}_{real,sim}_{mlMethod}
conf.mlMethods = {'svmPoly', 'svmLinear', 'svmRBF', 'mlm', 'mlmNN'};
conf.numRep = 3;


%% ======= Experimentos =======
strModel = 'har_extr_%s';

% conf.descr = sprintf(strModel, 'pca');
% evaluate_ml(data_pca, conf)

% conf.descr = sprintf(strModel, 'kpca');
% evaluate_ml(data_kpca, conf)
% 
% conf.descr = sprintf(strModel, 'mds');
% evaluate_ml(data_mds, conf)
% 
% conf.descr = sprintf(strModel, 'lda');
% evaluate_ml(data_lda, conf)
% 
% conf.descr = sprintf(strModel, 'lsda');
% evaluate_ml(data_lsda, conf)
% 



%% SOM
X = load('../../../Documents/MATLAB/har/test/X_test.txt');
labels = load('../../../Documents/MATLAB/har/test/Y_test.txt');
data = [X labels];

conf.mlMethods = {'SOMKNN'};
conf.numRep = 3

% conf.descr = sprintf(strModel, 'som_knn10');
% conf.extraSOMKNN.K = 3;
% conf.extraSOMKNN.tamanho = [10 10];
% evaluate_ml(data, conf)


conf.descr = sprintf(strModel, 'som_knn50');
conf.extraSOMKNN.K = 3;
conf.extraSOMKNN.tamanho = [50 50];
evaluate_ml(data, conf)


% ACC: 0.853288 10
% ACC: 0.890388 15
% ACC: 0.925801 20
% ACC: 0.932546 25
% ACC: 0.924115 30