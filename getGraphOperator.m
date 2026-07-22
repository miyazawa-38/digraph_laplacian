%% グラフ作用素を算出する関数

function [H, D, L, L_, U, lambda] = getGraphOperator(A)

  % A: 隣接行列
  % H: エルミート隣接行列
  % L: エルミートグラフラプラシアン
  % L_: 正規化エルミートグラフラプラシアン
  % U: 固有ベクトル行列
  % lambda: 固有値のベクトル

  % エルミート隣接行列
  H = getHermitianAdjencyMatrix(A);

  % エルミート隣接行列に対しての次数行列
  D = getDegreeMatrix(H);
  
  % エルミートグラフラプラシアン
  L = D - H;
  
  % 正規化エルミートグラフラプラシアン
  L_ = D^(-1/2) * L * D^(-1/2);

  % 固有ベクトル行列、固有値を対角に並べた行列
  [U,Lambda] = eig(L_);
  Lambda = real(Lambda);
  [lambda, idx] = sort(diag(Lambda), 'ascend');
  U = U(:,idx);
  Lambda = diag(lambda);
end
