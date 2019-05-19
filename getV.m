function newV = getV(y,level, states, n)

newV = zeros(n,1); 
for j = 1 : n
    newV(j) = y((j-1) * states + getq(level));
    
end
end

