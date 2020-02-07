dimension = 7;
populationSize = 10;
% tournamentSize = 5;
% a = 0.5;
% ELITISM = 4;

population = zeros(populationSize, dimension);

% i = 0;
for j = 1:populationSize

    population(j, :) = rand(1, dimension) * 20;
    % i = i + 1;

end

% disp(population(1, :))

[fsort, indexsort] = sort(population(1, :)); % population(1, :) =~ populationFitness
population(1, :) = fsort; % fsort =~ population
disp(fsort)

parent = rouletteWheelSelection(dimension, fsort)


% sumFinesses = sum(fsort);
% individualProbabilities = cumsum(fsort);
% flipProbabilities = flip(individualProbabilities)
% rouletteWheelPosition = rand * sumFinesses

% i = find(rouletteWheelPosition<=individualProbabilities,1,'first')

% summ = 0;
% for ind = 1:dimension
%     summ = summ + fsort(ind);
% end
% disp(summ)
% % instaed do this


% roulette = zeros(1, dimension);

% for ind = 1:dimension
%     roulette(ind) = fsort(ind) / sumFinesses;
% end

% disp(roulette)

% disp(population(1, :))

% randRoulette1 = rand

% sum1 = 0;
% indexParentI = 0;

% while sum1 < randRoulette1
%     indexParentI = indexParentI + 1;
%     sum1 = sum1 + individualProbabilities(indexParentI);
% end

% disp(indexParentI)
% disp(sum1)

% % test1 = sumFinesses / fsort(1)
% % test2 = sumFinesses / fsort(7)

% rouletteWheelPosition = rand * sumFinesses;
% % rouletteWheelPosition = 20;
% % fprintf('rouletteWheelPosition: %f\n', rouletteWheelPosition);

% % individualProbabilities = cumsum(population(1, :), 'reverse')
% % i = find(rouletteWheelPosition<=c,1,'first')
% test1 = sumFinesses / fsort(1)
% test1 = sumFinesses / fsort(2)

% probabilitySum = 0;
% for i = 1:length(fsort)
%     probabilitySum = probabilitySum + fsort(i);
% end
% fprintf('probabilitySum: %f\n', probabilitySum);
% test1 = fsort(7) / probabilitySum

% for i = 1 : dimension
%     if rouletteWheelPosition >= flipProbabilities(i)
%         individual = fsort(i);
%         disp(i)
%         break
%     else
%         individual = fsort(i);
%     end
% end
% disp(individual)


% spinWheel = 0;
% for i = 1:length(fsort)
%     spinWheel = spinWheel + fsort(i);
%     rouletteWheelPosition<=individualProbabilities
%     fprintf('spinWheel: %f\n', spinWheel);
%     if spinWheel >= rouletteWheelPosition
%     % if spinWheel <= rouletteWheelPosition
%         individual = fsort(i);
%         % fprintf('spinWheel: %f\n', spinWheel);
%         break
%     end

%     % disp(fsort(i))
% end
% % individual = fsort(i);

% fprintf('Individual: %f\n', individual);

% i = 1;
% while spinWheel <= rouletteWheelPosition
%     disp(fsort(i))
%     spinWheel = spinWheel + fsort(i);
% end

% disp(spinWheel)

% selectionratio = 0.25;

% %select the top selectionratio % of the total population
% indexselect = 1:floor(populationSize * selectionratio);
% nselect = length(indexselect);

% %shuffle the order of selected chromosomes
% Indexselect = indexselect(randperm(nselect));

% %divide into two pools
% indexmales = indexselect(1:floor(nselect / 2));
% indexfemales = indexselect(1 + floor(nselect / 2):end);

% nchildren = floor(nselect / 2) * 2;
% % children = zeros(nchildren, dimension);

% for i = 1:length(indexmales)
%     father = population(indexmales(i), :);
%     mother = population(indexfemales(i), :);

%perform crossover
%     child1 = crossover(dimension, father, mother);
%     child2 = crossover(dimension, father, mother);

%     children(i * 2 - 1, :) = child1;
%     children(i * 2, :) = child2;
% end

% disp(children)
% % disp(population(end-nchildren + 1:end, :))

% newPopulation = population;
% newPopulation(end-nchildren + 1:end, :) = children;
% % newPopulation(end-nmutants+1-nchildren:end-nmutants,:) = children;
% population = newPopulation;

% disp(population)
% upper = 0.8;

% disp(population(1, :))

% i = find(population(1, :) > upper)

% population(1, i) = 100;

% disp(population(1, :))

% if child(i) > upper
%     child(i) = upper;
% end

% if child(i) < lower
%     child(i) = lower;
% end

% parent1 = population(1, :)
% parent2 = population(2, :)

% child = crossover(dimension, parent1, parent2)

% disp(population(1, :))
% [~, so] = sort(population(1, :));
% disp(so)
% population(1, :) = population(so, :)(so);
% disp(population(1, :))

% population(1, :) = gaussianDistributionMutation(population(1, :));

% population(1, :) = population(1, :) + sqrt(delta)*randn(1);
% disp(population(1, :))

% idx = ELITISM + 1; % odda tal

% while idx < populationSize

%     p1 = population(idx, :);
%     p2 = population(idx + 1, :);

%     idx = idx + 2;
% end

% r = rand

% if r < 0.8
%     fprintf('H')
% else
%     fprintf('T')
% end

% ok = sqrt(delta) * randn(1)

% display(delta)
% display(pi)

% t = tournamentSelection(populationSize, tournamentSize, population);
% disp(t)

% parent1 = rand(1, populationSize);
% parent2 = rand(1, populationSize);

% fprintf('Parent1: ');
% disp(parent1)
% fprintf('Parent2: ');
% disp(parent2)

% k = randi([1, numel(parent1) - 1])
% fprintf('Point k: %d\n', k);

% [offspring1, offspring2] = wholeArithmeticCrossover(a, parent1, parent2);
% fprintf('Offspring1: ');
% disp(offspring1)
% fprintf('Offspring2: ');
% disp(offspring2)
