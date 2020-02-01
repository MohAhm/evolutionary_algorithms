path = '/Users/moah11/Documents/AI/evolutionary_algorithms/2005';
addpath(genpath(path))

%functions = [1 2 3 4 5 6 7 8 9 10]; %functions being solved
functions = 1;
%example: functions = [2 4 9];
numF = size(functions, 2);
nTimes = 20; % Number of times in which a function is going to be solved
% nTimes = 1; % Number of times in which a function is going to be solved
dimension = 30; % Dimension of the problem
% dimension = 7; % Dimension of the problem
populationSize = 100; % Adjust this to your algorithm

tournamentSize = 5;
elitism = 24;
crossoverAlpha = 0.5;
crossoverRate = 0.8;

for i = 1:numF

    fitfun = functions(i); %fitfun is the function that we are solving

    fprintf('\n-----  Function %d started  -----\n\n', fitfun);

    for t = 1:nTimes

        maxEval = 10000 * dimension; % maximum number of evaluation
        [value, upper, lower, objetiveValue, o, A, M, a, alpha, b] = getInformation_2005(fitfun, dimension);

        currentEval = 0;

        % Start generating the initial population
        population = zeros(populationSize, dimension);

        for j = 1:populationSize

            population(j, :) = lower + (upper - lower) .* rand(1, dimension);

        end
        % disp(population)

        populationFitness = calculateFitnessPopulation_2005(fitfun, population, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better)
        bestSolutionFitness = min(populationFitness);
        currentEval = currentEval + populationSize;
        % disp(populationFitness)

        % individualFitness = calculateFitness_2005(fitfun, population(p, :), o, A, M, a, alpha, b);
        % disp(individualFitness)

        %% SORT .......
        % fprintf('Population before sort: \n');
        % disp(population)
        % disp(populationFitness)
        % [~, so] = sort(populationFitness);
        % population = population(so, :);
        % disp(so)
        % fprintf('Population after sort: \n');
        % disp(population)


        %% SELECTION .......
        % p1 = tournamentSelection(populationFitness, populationSize, tournamentSize);


        % Algorithm loop

        while (objetiveValue < bestSolutionFitness && currentEval < maxEval)

            % Your algorithm goes here

            populationFitness = calculateFitnessPopulation_2005(fitfun, population, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better)
            % bestSolutionFitness = min(populationFitness);
            currentEval = currentEval + populationSize;
            % disp(populationFitness)

            %% Sort population
            [~, s] = sort(populationFitness);
            population = population(s, :);

            idx = elitism + 1;
            while idx < populationSize

                %  Select individual
                p1 = tournamentSelection(populationFitness, populationSize, tournamentSize);
                parent1 = population(p1, :);
                p2 = tournamentSelection(populationFitness, populationSize, tournamentSize);
                parent2 = population(p2, :);

                %  Apply crossover
                [offspring1, offspring2] = simpleArithmeticCrossover(crossoverRate, crossoverAlpha, parent1, parent2);

                %  Mutate the individual
                offspring1 = gaussianDistributionMutation(offspring1);
                offspring2 = gaussianDistributionMutation(offspring2);

                % Place the resulting chromosomes into the population
                population(idx, :) = offspring1;
                population(idx + 1, :) = offspring2;

                idx = idx + 2;
            end


            % Your algorithm goes here

        end

        % disp(population)

        % best individual
        bestSolutionFitness = min(populationFitness);
        fprintf('%dth run, The best individual fitness is %d\n', t, bestSolutionFitness);

        % theIndividual = find(populationFitness==bestSolutionFitness, 1, 'first');
        % disp(population(theIndividual, :))
        
        % disp(populationFitness);

    end

end
