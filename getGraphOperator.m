## グラフ作用素を算出する関数

function [H, D, L, L_] = getGraphOperator(A)

  ## A: 隣接行列
  ## H: エルミート隣接行列
  ## L: エルミートグラフラプラシアン
  ## L_: 正規化エルミートグラフラプラシアン

  ## エルミート隣接行列を算出する
  H = getHermitianAdjencyMatrix(A);

  ## エルミート隣接行列に対しての次数行列を算出する
  D = getDegreeMatrixForHermitian(H);
  
  ## エルミートグラフラプラシアン
  L = D - H;
  
  ## 正規化エルミートグラフラプラシアン
  L_ = D^(-1/2) * L * D^(-1/2);
end
