path = '/Users/moah11/Documents/AI/evolutionary_algorithms/2005';
addpath(genpath(path))

%functions = [1 2 3 4 5 6 7 8 9 10]; %functions being solved
functions = 1;
%example: functions = [2 4 9];
numF = size(functions, 2);
% nTimes = 20; % Number of times in which a function is going to be solved
nTimes = 1; % Number of times in which a function is going to be solved
dimension = 30; % Dimension of the problem
populationSize = 10; % Adjust this to your algorithm

tournamentSize = 5;

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

        disp(population)
        %disp(population(1,:))

        populationFitness = calculateFitnessPopulation_2005(fitfun, population, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better)
        bestSolutionFitness = min(populationFitness);
        currentEval = currentEval + populationSize;
        % disp(populationFitness)

        p = tournamentSelection(populationFitness, populationSize, tournamentSize);
        parent = population(p, :);
        disp(parent)

        % individualFitness = calculateFitness_2005(fitfun, population(p, :), o, A, M, a, alpha, b);
        % disp(individualFitness)

        % Algorithm loop

        while (objetiveValue < bestSolutionFitness && currentEval < maxEval)

            % Your algorithm goes here

            populationFitness = calculateFitnessPopulation_2005(fitfun, population, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better)
            bestSolutionFitness = min(populationFitness);
            currentEval = currentEval + populationSize;

            %%  Select individual
            %               tournament = tournamentSelection(dimension, tournamentSize, population);
            %               disp(tournament)
            %               tournamentFitness = calculateFitnessPopulation_2005(fitfun, tournament, o, A, M, a, alpha, b);
            %               parent = min(tournamentFitness);
            %               disp(parent)

            % fprintf('Parent %d\n', parent);

            %%  Apply crossover

            %%  Mutate the individual

            % ...

            % Your algorithm goes here

        end

        % best individual
        bestSolutionFitness = min(populationFitness);
        fprintf('%dth run, The best individual fitness is %d\n', t, bestSolutionFitness);

    end

end
