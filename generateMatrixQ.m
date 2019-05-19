function [Q,Qdelta, Q11, Q12, Q13] = generateMatrixQ(Adelta, A11, A12, A13, states)

Qdelta = zeros(states);
Q11 = zeros(states);
Q12 = zeros(states);
Q13 = zeros(states);

sAdelta=sum(Adelta,2);
s11=sum(A11,2);
s12=sum(A12,2);
s13=sum(A13,2);

for i=1: states
    for j=1:states
        if i==j 
            Qdelta(i,j) = sAdelta(i)-Adelta(i,j);
            Q11(i,j) = s11(i)-A11(i,j);
            Q12(i,j) = s12(i)-A12(i,j);
            Q13(i,j) = s13(i)-A13(i,j);
        else
            Qdelta(i,j) = -Adelta(i,j);
            Q11(i,j) = -A11(i,j);
            Q12(i,j) = -A12(i,j);
            Q13(i,j) = -A13(i,j);
        end
    end
end

Q = [Qdelta, Q11, Q12, Q13];
       