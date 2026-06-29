%% 鎌田さんのランダムプロットそのまま

function [w,f,x] = randplot(s_1,s_2)
size = 100;
rng(0)
x = 2*rand(2,size);
%scatter(x(1,:),x(2,:));
w = zeros(size);
for n=1:size
    for m=1:size
        if m > n
            if (norm(x(:,m) - x(:,n)))^2 <= 0.6
                w(m,n) = exp(-((norm(x(:,m) - x(:,n)))^2)/2 * s_1 * s_1);
            end
        end
        if m < n
            w(m,n) = s_2 * w(n,m);
        end
    end
end
f = ones(1,size);

for m=1:size
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

%f = ceil(rand(1,500)-0.5)*2 - 1;
