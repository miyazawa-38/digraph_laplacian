%% グラフ信号を生成する関数

function x = generateGraphSignal(A)

  % x: グラフ信号
  % A: 隣接行列

  x = sum(A,2);
end
