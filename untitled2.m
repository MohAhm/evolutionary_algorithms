dimension = 7;
populationSize = 10;
elitism = 2;


population = zeros(populationSize, dimension);

% i = 0;
for j = 1:populationSize

    population(j, :) = rand(1, dimension) * 20;
    % i = i + 1;

end


[fsort, indexsort] = sort(population(1, :)); % population(1, :) =~ populationFitness
population(1, :) = fsort; % fsort =~ population
disp(fsort)

parent = rouletteWheelSelection(dimension, fsort)
% disp(fsort(parent))


% disp(population(1, :))
% arr = population(1, :)

% for i = elitism : dimension/2
%     fprintf('elem1: %f\n', arr(i * 2 - 1));
%     fprintf('elem2: %f\n', arr(i * 2));
% end