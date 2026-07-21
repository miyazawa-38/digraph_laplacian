%% main関数

addpath('datasets/email');  % emailの隣接行列
A = getAdjencyMatrixForEmail();

% addpath('datasets/kamata')  % 鎌田さんのランダムプロットを使用
% [A,f,x] = randomPlot();

% グラフ作用素を算出する関数
[H, D, L, L_] = getGraphOperator(A);
disp(any(diag(D) == 0));
[U,Lambda] = eig(L_);

% disp(ismatrix(A));
disp(full(A(1:10, 1:10)));
% disp(H);
% disp(D);
% disp(U);
% disp(Lambda);
