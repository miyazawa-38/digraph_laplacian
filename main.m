## 隣接行列
A = [0,3; 1,0]

## エルミート隣接行列を算出する
H = getHermitianAdjencyMatrix(A)

## エルミート隣接行列に対しての次数行列を算出する
D = getDegreeMatrixForHermitian(H)

## エルミートグラフラプラシアン
L = D - A


