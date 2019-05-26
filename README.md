# SIAP

Для запуска процесса на слуйчайном графе:
  1) Запустить файл "SIAP.m" из корня.
  
Будет построен график функции Y и записана информация в файл  "my_file.txt"


Параметры модели, которые можно варьировать

tf = 1; - время моделлирования

n = 100; - количество узлов в случайном графе


partI = 5; - начальное количество узов в состоянии I


partA = 30; - начальное количество узов в состоянии A


partP = 2; - начальное количество узов в состоянии P

bettaS = 0.2; - величина интенсивности (вероятности) перехода S -> I


bettaA = 0.4; - величина интенсивности (вероятности) перехода A -> I


g = 0.5; - величина интенсивности (вероятности) перехода S -> A


gamma = 0.3; - величина интенсивности (вероятности) перехода I -> P, A ->P


delta1 = 0.4; - величина интенсивности (вероятности) перехода I -> S


delta2 = 0.3; - величина интенсивности (вероятности) перехода P -> S
