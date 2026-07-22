%% 村松先生の次数行列を用いてグラフ作用素を算出する関数

function [H, D_k, L_k, L_tilde_k, U_k, lambda_k] = getGraphOperatorOfMuramatsu(A)

  % A: 隣接行列
  % H: エルミート隣接行列
  % L_k: 村松先生のエルミートグラフラプラシアン
  % L_tilde_k: 村松先生の正規化エルミートグラフラプラシアン
  % U_k: 村松先生の固有ベクトル行列
  % lambda_k: 村松先生の固有値のベクトル

  % エルミート隣接行列
  H = getHermitianAdjencyMatrix(A);

  % 次数行列
  D_k = getDegreeMatrixOfMuramatsu(H);

  % グラフラプラシアン
  L_k = D_k - H;

  % 正規化グラフラプラシアン
  L_tilde_k = D_k^(-1/2) * L_k * D_k^(-1/2);

  % 固有ベクトル行列、固有値を対角に並べた行列
  [U_k,Lambda_k] = eig(L_tilde_k);
  Lambda_k = real(Lambda_k);
  [lambda_k, idx] = sort(diag(Lambda_k), 'ascend');
  U_k = U_k(:,idx);
  Lambda_k = diag(lambda_k);
end
