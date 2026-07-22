• まずは 隣接行列そのものの描画 と 信号の描画 を分けるのがいいです。

  今の A は

  A(i,j) = i から j へのメール送信数

  なので、MATLAB では digraph(A) で有向グラフとして出せます。

  G = digraph(A);

  figure;
  p = plot(G, 'Layout', 'force');
  title('Email network');

  ただし、そのままだと辺が多くて見づらいので、メール数が多い辺だけ表示するのがおすすめです。

  threshold = 3;              % 3通以上の辺だけ表示
  A_plot = A;
  A_plot(A_plot < threshold) = 0;

  G = digraph(A_plot);

  figure;
  p = plot(G, 'Layout', 'force', 'LineWidth', 0.5);
  title('Email network');

  頂点信号 x やフィルタ後信号 y を見たいなら、ノードの色として出すのが自然です。

  G = digraph(A_plot);

  figure;
  p = plot(G, 'Layout', 'force');
  p.NodeCData = real(x);
  colorbar;
  title('Original graph signal');

  フィルタ後なら、

  figure;
  p = plot(G, 'Layout', 'force');
  p.NodeCData = real(y);
  colorbar;
  title('Filtered graph signal');

  元信号とフィルタ後を比較するならこれが見やすいです。

  threshold = 3;
  A_plot = A;
  A_plot(A_plot < threshold) = 0;
  G = digraph(A_plot);

  figure;

  subplot(1,2,1);
  p1 = plot(G, 'Layout', 'force');
  p1.NodeCData = real(x);
  colorbar;
  title('Original signal');

  subplot(1,2,2);
  p2 = plot(G, 'Layout', 'force');
  p2.NodeCData = real(y);
  colorbar;
  title('Filtered signal');

  ただし、plot(G, 'Layout', 'force') は毎回配置が変わることがあります。比較したいなら、1回目の座標を使い回すとよいです。

  figure;

  subplot(1,2,1);
  p1 = plot(G, 'Layout', 'force');
  p1.NodeCData = real(x);
  colorbar;
  title('Original signal');

  X = p1.XData;
  Y = p1.YData;

  subplot(1,2,2);
  p2 = plot(G, 'XData', X, 'YData', Y);
  p2.NodeCData = real(y);
  colorbar;
  title('Filtered signal');

  個人的には、今の段階ではこの出力が一番よいです。

  threshold = 3;
  A_plot = A;
  A_plot(A_plot < threshold) = 0;
  G = digraph(A_plot);

  figure;

  subplot(1,2,1);
  p1 = plot(G, 'Layout', 'force');
  p1.NodeCData = real(x);
  colorbar;
  title('Original signal');

  X = p1.XData;
  Y = p1.YData;

  subplot(1,2,2);
  p2 = plot(G, 'XData', X, 'YData', Y);
  p2.NodeCData = real(y);
  colorbar;
  title('Filtered signal');

  もし論文・発表用にするなら、グラフ全体図よりも

  stem(real(x));
  stem(real(y));
  plot(lambda, abs(x_hat));
  plot(lambda, abs(y_hat));

  みたいに、信号とスペクトルの変化を出す図の方が説明しやすいです。
