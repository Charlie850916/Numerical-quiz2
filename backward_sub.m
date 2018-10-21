function x = backward_sub(U,b)
    % solving Ux = b
    [n,~] = size(U);
    x = zeros(n,1);
    i = n;
    while i>0
        x(i,1) = (b(i,1) - dot(U(i,i+1:n),x(i+1:n,1)))/U(i,i);
        i = i-1;
    end
end