function answer = generateInitV(I,A,P,n, indexForA)

if ( A > length(indexForA))
   error('Chislo dlya "A" slishkom bolshoe ili malo indexsov "indexForA"'); 
end

if ( A + I + P > n)
   error('A + I + P > n'); 
end

if ( A + I + P == n)
   warn('A + I + P == n. V sisteme ne budet S'); 
end


answer = zeros(n*4,1);

%Sredstva massovoy informacii (Mass media)
for i = n - 2 : n
    cell = zeros(4,1);
    cell(2) = 1; % 2 eto I -> sIap
    answer((i-1) * 4 + 1: i * 4) = cell;
end

AIndexes = indexForA(1:A);

IIndexes = [];
PIndexes = [];

currentIndex = 1;
while (I > 0)
    if (~ismember(currentIndex, AIndexes))
       IIndexes = [IIndexes, currentIndex]; 
       I = I - 1;
    end
    currentIndex = currentIndex + 1;
end

while (P > 0)
    if (~ismember(currentIndex, AIndexes))
       PIndexes = [PIndexes, currentIndex]; 
       P = P - 1;
    end
    currentIndex = currentIndex + 1;
end

%teper zapolnyaem po indexam


for i = 1 : length(IIndexes)
    idx = IIndexes(i);
    cell = zeros(4,1);
    cell(2) = 1; % 2 eto I -> sIap
    answer((idx-1) * 4 + 1: idx * 4) = cell;
end

for i = 1 : length(AIndexes)
    idx = AIndexes(i);
    cell = zeros(4,1);
    cell(3) = 1; % 3 eto A -> siAp
    answer((idx-1) * 4 + 1: idx * 4) = cell;
end


for i = 1 : length(PIndexes)
    idx = PIndexes(i);
    cell = zeros(4,1);
    cell(4) = 1; % 4 eto P -> siaP
    answer((idx-1) * 4 + 1: idx * 4) = cell;
end

IAPIndexes = [IIndexes, AIndexes, PIndexes];


for i = 1 : n - 3
    if (~ismember(i, IAPIndexes))
        cell = zeros(4,1);
        cell(1) = 1; % 1 eto S -> Siap
        answer((i-1) * 4 + 1: i * 4) = cell;
    end
end


end

