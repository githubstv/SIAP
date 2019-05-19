function dydt = odeFunc(t, y, A, levels, Q1T, n, states, N, QdeltaT)

%N = length(y);

%QdeltaT already transposed
dydt = zeros(N,1);

for i = 1 : states : N
    
   dydt(i:i + states - 1) = [
       ( -QdeltaT  - getSumsFori(y,fix(i/states) + 1, A, levels, Q1T, n, states)) *  y(i : i + states - 1)
   ];
end

end

