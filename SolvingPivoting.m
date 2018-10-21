function [x,y] = SolvingPivoting(L,U,Perm,b)
  % y = L^-1Pb, x = U^-1y
  [n,~] = size(L);
  x = zeros(1,n);
  y = zeros(1,n);
  for i = 1 : n
      y(i) = b(Perm(i)) - dot(L(i,1:i-1),y(1:i-1));
  end
  for k = 1 : n
      i = n-k+1;
      x(i) = (y(i) - dot(U(i,i+1:n),x(i+1:n)) ) /U(i,i);
  end
end