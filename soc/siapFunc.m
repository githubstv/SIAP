function [result, t] = siapFunc(A, n, param, initialV, t0, tf)

    levels = 3;
    states = 4;

    N = states * n;

    bettaS = param('bettaS');
    bettaA = param('bettaA');
    k = param('k');
    gamma = param('gamma');
    delta1 = param('delta1');
    delta2 = param('delta2');



    [stA, Adelta, A11, A12, A13] = generateMatrixStA(delta1,delta2, bettaA, bettaS, k ,gamma);

    [Q, Qdelta, Q11, Q12, Q13] = generateMatrixQ(Adelta, A11, A12, A13, states);

    QdeltaT = Qdelta';
    Q11T = Q11';
    Q12T = Q12';
    Q13T = Q13';
    Q1T= [Q11T, Q12T,Q13T];

    [t,y] = ode45(@(t,y) odeFunc(t, y, A, levels, Q1T, n, states, N, QdeltaT),[t0 tf], initialV);

    result = containers.Map();

    result('S') = y(:,1:states:N);
    result('I') = y(:,2:states:N);
    result('A') = y(:,3:states:N);
    result('P') = y(:,4:states:N);
    result('t') = t;
    result('y') = y;

end