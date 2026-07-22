• Octave 互換性は MATLAB とズレやすいので、今の提案に含まれる digraph/plot(G) が Octave で使えるかを前提から確認して答えます。必要なら Octave 向けの代替コードも出します。

• 先ほどの

  G = digraph(A);
  plot(G, 'Layout', 'force');

  は Octave では基本的に動かない と思った方がいいです。digraph は MATLAB の Graph and Network Algorithms 系の機能で、Octave には MATLAB 互換の digraph / graph 描画機能が十分にはありま
  せん。

  なので、

  Octaveで動くものはMATLABでも基本動く？

  は、だいたい はい です。
  ただし逆、

  MATLABで動くものはOctaveでも動く？

  は、かなり注意が必要です。特に digraph, graph, 一部の描画機能, toolboxes, 新しめの関数は Octave で動かないことがあります。

  Octave でも MATLAB でも動かしたいなら、digraph を使わずに、隣接行列から座標を自分で用意して plot, scatter, line で描くのが安全です。

  例えば簡易版はこうです。

  function plotDirectedGraph(A, signal)
    n = size(A, 1);

    % 円周上に頂点を配置
    theta = linspace(0, 2*pi, n+1);
    theta(end) = [];

    X = cos(theta);
    Y = sin(theta);

    [src, dst, w] = find(A);

    figure;
    hold on;

    % 辺を描画
    for k = 1:length(src)
      i = src(k);
      j = dst(k);

      plot([X(i), X(j)], [Y(i), Y(j)], 'Color', [0.7 0.7 0.7]);
    end

    % 頂点を信号値で色付け
    scatter(X, Y, 60, real(signal), 'filled');
    colorbar;

    axis equal;
    axis off;
    hold off;
  end

  使い方は、

  plotDirectedGraph(A_plot, x);

  フィルタ後なら、

  plotDirectedGraph(A_plot, y);

  ただし、円周配置は見やすさに限界があります。頂点数が多いとかなり混みます。研究用には、グラフ構造そのものよりも以下の出力の方が Octave/MATLAB 両対応で安定です。

  figure;
  subplot(2,1,1);
  stem(real(x));
  title('Original signal');

  subplot(2,1,2);
  stem(real(y));
  title('Filtered signal');

  スペクトルを見るなら、

  figure;
  subplot(2,1,1);
  plot(lambda, abs(x_hat), 'o');
  title('Original spectrum');

  subplot(2,1,2);
  plot(lambda, abs(y_hat), 'o');
  title('Filtered spectrum');

  結論としては、Octaveでも動かすなら digraph は使わない方がいいです。
  plot, scatter, stem, imagesc, spy あたりを使うコードにしておくと、MATLABでもOctaveでもほぼ動きます。
