clear; close all; clc;
addpath('../../../Documents/MATLAB/drtoolbox/');
addpath('../../../Downloads/LinearDiscriminantAnalysis');


%% Carrega os dados 
X = load('../../../Documents/MATLAB/har/test/X_test.txt');
labels = load('../../../Documents/MATLAB/har/test/Y_test.txt');
numDim = size(X, 2);


%% PCA
tic
[eigvector, eigvalue] = PCA(X,numDim);
data_pca = X*eigvector;
tempo_pca = toc;
data_pca = [data_pca labels];

%% KPCA
tic
options.KernelType = 'Gaussian';
options.t = 5;
options.ReducedDim = numDim;
[eigvector, eigvalue] = KPCA(X,options);
Ktest = constructKernel(X,[],options);
data_kpca = Ktest*eigvector;
tempo_kpca = toc;
data_kpca = [data_kpca labels];

% plot(data_kpca(find(data_kpca(:,end)==1), 1), data_kpca(find(data_kpca(:,end)==1), 2), 'o')
% hold on
% plot(data_kpca(find(data_kpca(:,end)==2), 1), data_kpca(find(data_kpca(:,end)==2), 2), 'or')
% figure
% plot(data_pca(find(data_pca(:,end)==1), 1), data_pca(find(data_pca(:,end)==1), 2), 'o')
% hold on
% plot(data_pca(find(data_pca(:,end)==2), 1), data_pca(find(data_pca(:,end)==2), 2), 'or')


%% MDS
tic
[data_mds, mapping] = compute_mapping(X, 'MDS', numDim);
tempo_mds = toc;
data_mds = [data_mds labels];


%% LDA
tic
data_lda = compute_mapping(X, 'LDA', numDim);
tempo_lda = toc;
data_lda = [data_lda labels];


%% LSDA
tic
options = [];
options.k = 5;
[eigvector, eigvalue] = LSDA(labels, options, X);
data_lsda = X*eigvector;
tempo_lsda = toc;
data_lsda = [data_lsda labels];

save('data_ext_har', 'data_kpca', 'data_lda', 'data_lsda', 'data_mds', ...
    'data_pca', 'tempo_kpca', 'tempo_lda', 'tempo_lsda', 'tempo_mds', 'tempo_pca')