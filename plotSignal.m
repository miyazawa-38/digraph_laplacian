function plotSignal(x,y);
  figure;
  subplot(2,1,1);
  stem(real(x));
  title('Original signal');

  subplot(2,1,2);
  stem(real(y));
  title('Filtered signal');
end
