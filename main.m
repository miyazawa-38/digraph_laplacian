%% main関数

% ヨーロッパのemailのネットワーク
addpath('datasets/email');  
A = getAdjencyMatrix();
x = generateGraphSignal(A);

% % 鎌田さんのランダムプロット
% addpath('datasets/kamata') 
% [A,f,x] = randomPlot();

% グラフ作用素を算出
[H, D, L, L_, U, Lambda] = getGraphOperator(A);

% disp(ismatrix(A));
% disp(full(A(1:10, 1:10)));
% disp(x(1:10));
% disp(full(H(1:10, 1:10)));


% GFT
x_hat = GFT(U, x);
disp(diag(Lambda)(1:10));
