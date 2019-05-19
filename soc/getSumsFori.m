function finalSum = getSumsFori(y,i, A, levels, Q1T, n, states)

%QbettaT already transposed
finalSum = zeros(states);
for k = 1 : levels
    currentLevel = A(i,(k-1)*n + 1:k*n);
    currentV = getV(y,k, states, n);
    finalSum = finalSum + (currentLevel * currentV) * Q1T(:,((k-1)*states + 1 : k * states));

end

end

