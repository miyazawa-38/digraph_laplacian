%% main関数

% ヨーロッパのemailのネットワーク
addpath('datasets/email');  
A = getAdjencyMatrix();
x = generateGraphSignal(A);

% % 鎌田さんのランダムプロット
% addpath('datasets/kamata') 
% [A,f,x] = randomPlot();

% グラフ作用素を算出
[H, D, L, L_, U, lambda] = getGraphOperator(A);

% GFT
x_hat = GFT(U, x);

% フィルタリング
y_hat = filterHeatKernel(x_hat, lambda, 5);
% y_hat = filterIdealLowpass(x_hat, lambda, 1);
% y_hat = filterIdealLowpass(x_hat, lambda, 2);

% IGFT
y = IGFT(U, y_hat);
disp(y_hat(1:10));
