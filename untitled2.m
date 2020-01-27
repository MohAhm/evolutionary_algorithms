dimension = 7;
populationSize = 10;
tournamentSize = 5;
a = 0.5;
ELITISM = 4;

population = zeros(populationSize, dimension);

% i = 0;
for j =1:populationSize

    population(j,:) = rand(1, dimension);
    % i = i + 1;

end

% disp(population)

idx = ELITISM + 1; % odda tal
while idx < populationSize

    p1 = population(idx,:);
    p2 = population(idx + 1,:);

    idx = idx + 2;
end



r = rand
if r < 0.8
    fprintf( 'H' )
else
    fprintf( 'T' )
end

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