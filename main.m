%% main関数

% ヨーロッパのemailのネットワーク
addpath('datasets/email');  
A = getAdjacencyMatrix('email-Eu-core-temporal-Dept1.txt');
x = generateGraphSignal(A);

% % 鎌田さんのランダムプロット
% addpath('datasets/kamata') 
% [A,f,x] = randomPlot();

% グラフ作用素
[H, D, L, L_tilde, U, lambda] = getGraphOperator(A);

% % 村松先生のグラフ作用素
% [H_k, D_k, L_k, L_tilde_k, U_k, lambda_k] = getGraphOperatorOfMuramatsu(A);

% GFT
x_hat = GFT(U, x);

% フィルタリング
y_hat = filterHeatKernel(x_hat, lambda, 5);
% y_hat = filterIdealLowpass(x_hat, lambda, 1);
% y_hat = filterIdealLowpass(x_hat, lambda, 2);

% IGFT
y = IGFT(U, y_hat);
% disp(y(1:10));

% 信号を描画
plotGraphSignal(x_hat, y_hat);
plotGraphSignal2(x_hat, y_hat);






