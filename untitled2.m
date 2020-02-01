dimension = 7;
populationSize = 10;
tournamentSize = 5;
a = 0.5;
ELITISM = 4;

population = zeros(populationSize, dimension);

% i = 0;
for j = 1:populationSize

    population(j, :) = rand(1, dimension);
    % i = i + 1;

end

disp(population)
% disp(population(1, :))
% [~, so] = sort(population(1, :));
% disp(so)
% population(1, :) = population(so, :)(so);
% disp(population(1, :))


[fsort indexsort] = sort(population,1,'descend');
population=population(indexsort,:);
disp(fsort)
disp(population)

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
