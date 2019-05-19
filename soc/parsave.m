function parsave(dir, fname, answer,param, initV)
    mkdir(dir);
    save(strcat(dir, '/',fname), 'answer', 'param', 'initV')
end