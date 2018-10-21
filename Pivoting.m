function [L,U,Perm,V,d] = Pivoting(A,b)
    % PA = LU where P is matrix repesentation of Perm
    % after elimination Ab -> Vd
    [n,~] = size(A);
    Perm(1,1:n) = 1:n;
    S = max(abs(A'));
    M = [A b];
    for k = 1 : n-1
        for j = k : n
            for i = k : n
                if( abs(M(Perm(j),k))/S(Perm(j)) < abs(M(Perm(i),k))/S(Perm(i)) )
                    break
                end
                if i == n
                    pivot = j;
                end
            end
        end
        tmp = Perm(k);
        Perm(k) = Perm(pivot);
        Perm(pivot) = tmp;
        for i = k+1 : n
            z = M(Perm(i),k)/M(Perm(k),k);
            M(Perm(i),k) = z;
            M(Perm(i),k+1:n+1) = M(Perm(i),k+1:n+1) - z*M(Perm(k),k+1:n+1); 
        end
    end
    V = M(1:n,1:n);
    d = M(1:n,n+1);
    L = zeros(n,n);
    U = zeros(n,n);
    for i = 1 : n
        U(i,i:n) = M(Perm(i), i:n);
        L(i,i) = 1;
        if(i>1)
            L(i, 1:i-1) = M(Perm(i), 1:i-1); 
        end
    end
end