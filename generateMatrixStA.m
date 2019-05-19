function [stA, Adelta, A11, A12,A13] = generateMatrixStA(delta1, delta2, bettaA, bettaS, k ,gamma)



Adelta=[0 0 0 0; delta1 0 0 0; 0 0 0 0; delta2 0 0 0];
A11=[0 0 k 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
A12 = [0 bettaS 0 0; 0 0 0 0; 0 bettaA 0 0; 0 0 0 0];
A13 = [0 0 0 0; 0 0 0 gamma; 0 0 0 gamma; 0 0 0 0];

stA=[Adelta, A11, A12,A13];
end



