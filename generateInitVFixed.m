function answer = generateInitVFixed(I,A,P,n)

answer = zeros(n*4,1);

for i = 1 : I
    cell = zeros(4,1);
    cell(2) = 1;
    answer((i-1) * 4 + 1: i * 4) = cell;
end

for i = I + 1 : I + A
    cell = zeros(4,1);
    cell(3) = 1;
    answer((i-1) * 4 + 1: i * 4) = cell;
end

for i = I + A + 1 : I + A + P
    cell = zeros(4,1);
    cell(4) = 1;
    answer((i-1) * 4 + 1: i * 4) = cell;
end

for i = I + A + P + 1 : n
    cell = zeros(4,1);
    cell(1) = 1;
    answer((i-1) * 4 + 1: i * 4) = cell;
end


end

