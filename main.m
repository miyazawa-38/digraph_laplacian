## 隣接行列
A = [0,3;
     1,0];

## グラフ作用素を算出する関数
[H, D, L, L_] = getGraphOperator(A)
[U,Lambda] = eig(L_)
