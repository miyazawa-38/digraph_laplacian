%% emailに対する隣接行列を算出する関数

function A = getAdjencyMatrixForEmail()
  data = dlmread("email-Eu-core-temporal.txt");

  % 開始頂点source, 終端頂点target
  source = data(:, 1) + 1;  % 0から始まるノードを1からにする
  target = data(:, 2) + 1;
  timestamp = data(:, 3);

  % 自己ループを除外
  XOR = source ~= target;  % 同じ要素は0、異なる要素は1のベクトル
  source = source(XOR);
  target = target(XOR);
  timestamp = timestamp(XOR);

  % ノード数
  N = max([source; target]);

  % 頂点から頂点へ送られたメールの総数
  A = sparse(source, target, 1, N, N);

  % 孤立頂点を除外する
  active = find(any(A,1).' | any(A,2));
  A = A(active, active);

  % 新しい行列番号に対応する、元のノードID
  nodeIDs = active - 1;
end
