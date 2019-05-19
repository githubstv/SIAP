function A = generateMatrixA(N, levels)
%GENERATEMATRIXA Summary of this function goes here
%   Detailed explanation goes here

TEMP = randi(2,N) - ones(N);

for i=1:levels
    temp= zeros(N) + triu(TEMP, 1) + triu(TEMP,1)';
    A(1:N,((i-1)*N+1):i*N)=temp;
end


end

