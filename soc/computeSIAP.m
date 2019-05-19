expName = 'rand100';
tf = 2;
facebookNetwotk = mmread(strcat(expName,'.mtx'));

sizeOfFacebook = size(facebookNetwotk);

facebookNetwotk(sizeOfFacebook(1) + 3,sizeOfFacebook(2) + 3 ) = 0;

nodeNumber = size(facebookNetwotk, 2);

secondLevelNetwork = mmread(strcat(expName,'-second.mtx'));

rank = full(sum(facebookNetwotk, 1));
[sorted, indexForA] = sort(-rank);

precentA = 0.02;
precentP = 0.05;


initA = floor(nodeNumber * precentA);
initP = floor(nodeNumber * precentP);

initV = generateInitV(0, initA, initP, nodeNumber, indexForA);



for i = 1: 19
    
    A = [facebookNetwotk, secondLevelNetwork, facebookNetwotk];

    param = containers.Map();
    param('bettaS') = 0.2;
    param('bettaA') = 0.4;
    param('k') = 0.95 - (i-1) * 0.05;
    param('gamma') = 0.3;
    param('delta1') = 0.4;
    param('delta2') = 0.2;
    
    answer = siapFunc(A, nodeNumber, param, initV, 0, tf);

   
    fileName = strcat(expName, '_experiment_', strcat('k',num2str(0.95 - (i-1) * 0.05),'_'),'.mat');
    parsave(expName, fileName, answer, param, initV);
    
    disp(strcat(expName,' done :', int2str(i)))
end

matConverter(expName);

disp('Process done')
