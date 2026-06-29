%% main関数

% % 隣接行列
% A = [0,3;
%      1,0];

% 隣接行列
s_1 = 0.0742;
s_2 = 0;
num_nodes = 10;
[A,f,x] = randomPlot(s_1, s_2, num_nodes);

% グラフ作用素を算出する関数
[H, D, L, L_] = getGraphOperator(A);
[U,Lambda] = eig(L_);

disp(A);
disp(H);
disp(D);
disp(U);
disp(Lambda);
