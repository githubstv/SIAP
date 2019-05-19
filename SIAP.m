clear all; close all;

%________________________________________________________________
fid = fopen('my_file.txt', 'w', 'native', 'UTF-8'); 
if fid == -1                     
    error('File is not opened'); 
end 

t0=0;
tf=1;

n = 100;
partI = 5;
partA = 30;
partP = 2;
levels = 3;
states = 4;
N = states * n;
fprintf(fid, 'Nodes: %d.\n', n);
fprintf(fid, 'Levels: %d.\n', levels);
fprintf(fid, 'States: %d.\n', states);

bettaS = 0.2;
bettaA = 0.4;
k = 0.5;
gamma = 0.3;
delta1 =0.4;
delta2 = 0.3;

fprintf(fid, 'bettaS: %.1f, ', bettaS);
fprintf(fid, 'bettaA: %.1f, ', bettaA);
fprintf(fid, 'k: %.1f, ', k);
fprintf(fid, 'gamma: %.1f, ', gamma);
fprintf(fid, 'delta1: %.1f, ', delta1);
fprintf(fid, 'delta2: %.1f.', delta2);
fprintf(fid, '\n');

%________________________________________________________________

A = generateMatrixA(n, levels);



[stA, Adelta, A11, A12, A13]=generateMatrixStA(delta1,delta2, bettaA, bettaS, k ,gamma);

[Q,Qdelta, Q11, Q12, Q13] = generateMatrixQ(Adelta, A11, A12, A13, states);

QdeltaT = Qdelta';
Q11T = Q11';
Q12T = Q12';
Q13T = Q13';
Q1T= [Q11T, Q12T,Q13T];

initialV = generateInitVFixed(partI, partA, partP, n);
vec = zeros(states,1);
statesChar = ['S', 'I', 'A','P'];
for i = 1 : states : N
    tmp = initialV(i : i + states - 1);
    vec = vec + tmp;
end
for i = 1:states
    fprintf(fid, '%s: %d, ', statesChar(i), vec(i));

end
fprintf(fid, '\n');
%________________________________________________________________


[t,y] = ode45(@(t,y) odeFunc(t, y, A, levels, Q1T, n, states, N, QdeltaT),[t0 tf], initialV);
mS=y(:,1:states:N);
mI=y(:,2:states:N);
mA=y(:,3:states:N);
mP=y(:,4:states:N);
mSs=mean(mS');
mIs=mean(mI');
mAs=mean(mA');
mPs=mean(mP');

%plot(t,y)
grid on
plot(t,mSs, 'LineWidth', 3)
hold on
plot(t,mIs, 'LineWidth', 3)
plot(t,mAs, 'LineWidth', 3)
plot(t,mPs, 'LineWidth', 3)

legend('S', 'I', 'A','P');


statesCharPercent = ['S', 'I', 'A','P'];

resultPercents = zeros(states + 1,1);
stepsInOde45 = size(y,1);
for i = 1:states
   resultPercents(i) =  (100 * sum(y(stepsInOde45,i:states:N))) / n;
end
resultPercents(states + 1) = 100 - sum(resultPercents);
for i = 1:states
    fprintf(fid, '%s: %.2f %%, ', statesCharPercent(i), resultPercents(i));

end
fclose(fid);