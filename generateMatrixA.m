function A = generateMatrixA(N, levels)
%GENERATEMATRIXA Summary of this function goes here
%   Detailed explanation goes here


for i=1:levels  
    TEMP = randi(2,N) - ones(N);
    temp= zeros(N) + triu(TEMP, 1) + triu(TEMP,1)';
    A(1:N,((i-1)*N+1):i*N)=temp;
end


end

