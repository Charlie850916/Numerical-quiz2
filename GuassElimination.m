function [U,c] = GuassElimination(A,b)
 % after elimination Ab -> Uc
 M = [A b];
 [n,~] = size(M);
 for k = 1 : n-1
     for i = k+1 : n
         z = M(i,k)/M(k,k);
         M(i,k) = 0;
         M(i,k+1:n+1) = M(i,k+1:n+1)-z*M(k,k+1:n+1);
     end
 end
 U = M(1:n,1:n);
 c = M(1:n,n+1);
end