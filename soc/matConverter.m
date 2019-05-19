function matConverter(expName)
    cd(expName)

    Files = dir('*.mat');

    Experiment = [];
    bettaS = [];
    bettaA = [];
    k = [];
    gamma = [];
    delta1 = [];
    delta2 = [];
    S = [];
    I = [];
    A = [];
    P = [];

    initS = [];
    initA = [];
    initI = [];
    initP = [];

    for i = 1 : length(Files)
        fileInfo = strsplit(Files(i).name, '_');

        load(Files(i).name)

        Experiment = [Experiment; (0.95 - param('k'))/ 0.05 + 1];
        bettaS = [bettaS; param('bettaS')];
        bettaA = [bettaA; param('bettaA')];
        k = [k; param('k')];
        gamma = [gamma; param('gamma')];
        delta1 = [delta1; param('delta1')];
        delta2 = [delta2; param('delta2')];

        lI = answer('I');
        lP = answer('P');
        lA = answer('A');
        lS = answer('S');
        t = answer('t');

        fig = figure();
        grid on
        plot(t,mean(lS, 2), 'LineWidth', 3);
        hold on
        plot(t,mean(lI, 2), 'LineWidth', 3);
        plot(t,mean(lA, 2), 'LineWidth', 3);
        plot(t,mean(lP, 2), 'LineWidth', 3);
        hold off;
        xlabel('time');
        ylabel('Y(t)');
        legend('yS', 'yI', 'yA','yP');

        figName = strcat(fileInfo{1}, '_', num2str((0.95 - param('k'))/ 0.05 + 1));
        savefig(fig, figName);


        I = [I; mean(lI(end, :))];
        A = [A; mean(lA(end, :))];
        P = [P; mean(lP(end, :))];
        S = [S; mean(lS(end, :))];

    end

    initS = [mean(lS(1,:))];

    initI = [mean(lI(1,:))];

    initA = [mean(lA(1,:))];

    initP = [mean(lP(1,:))];

    T = table(Experiment,bettaS,bettaA,k,gamma,delta1,delta2,S, I,A,P);
    initT = table(initS, initI, initA, initP);

    filename = strcat(fileInfo{1}, '_1.xlsx');
    writetable(T,filename,'Sheet',1,'Range','D3');

    writetable(initT,filename,'Sheet',1,'Range','B1')
    cd('..')
end