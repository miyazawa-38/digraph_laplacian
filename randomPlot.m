%% 鎌田さんのランダムプロット内容のまま（コードは変更）

function [A,f,x] = randomPlot(s_1, s_2, num_nodes)
  rng(0)
  x = 2*rand(2,num_nodes);
  %scatter(x(1,:),x(2,:));
  A = zeros(num_nodes);
  for n=1:num_nodes
      for m=1:num_nodes
          if m > n
              if (norm(x(:,m) - x(:,n)))^2 <= 0.6
                  A(m,n) = exp(-((norm(x(:,m) - x(:,n)))^2)/2 * s_1 * s_1);
              end
          end
          if m < n
              A(m,n) = s_2 * A(n,m);
          end
      end
  end
  f = ones(1,num_nodes);
  
  for m=1:num_nodes
      if x(1,m)>1
          if x(2,m)>1
              f(m) = -1;
          end
      end
  
      if x(1,m)<1
          if x(2,m)<1
              f(m) = -1;
          end
      end
  end
end

%f = ceil(rand(1,500)-0.5)*2 - 1;
