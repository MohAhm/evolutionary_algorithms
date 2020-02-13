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

mutationRate = 0.2;


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


        % [fitnessSort, indexsort] = sort(populationFitness);
        % population = population(indexsort, :);
        % % disp(population)

        % p1 = rouletteWheelSelection(dimension, populationFitness, fitnessSort);
        % father = population(p1, :);
        % fprintf('Father: ');
        % disp(father)

        % p2 = rouletteWheelSelection(dimension, populationFitness, fitnessSort);
        % while p1 == p2
        %     p2 = rouletteWheelSelection(dimension, populationFitness, fitnessSort);
        % end
        % mother = population(p2, :);
        % fprintf('Mother: ');
        % disp(mother)

        % offspring1 = blxCrossover(dimension, father, mother, upper, lower);
        % % offspring2 = blxCrossover(dimension, father, mother, upper, lower);
        % fprintf('Offspring1: ');
        % disp(offspring1)
        % fprintf('Offspring2: ');
        % disp(offspring2)

        % mutatedOffspring1 = gaussianMutation(dimension, offspring1, mutationRate);
        % fprintf('MutatedOffspring1: ');
        % disp(mutatedOffspring1)
        
        % offspring1Fitnes1 = calculateFitness_2005(fitfun, offspring1, o, A, M, a, alpha, b)
        % offspring1Fitnes2 = calculateFitness_2005(fitfun, offspring2, o, A, M, a, alpha, b)


        % Algorithm loop

        while (objetiveValue < bestSolutionFitness && currentEval < maxEval)

            % Your algorithm goes here

            % Sort population
            [fitnessSort, indexsort] = sort(populationFitness);
            population = population(indexsort, :);

            newPopulation = zeros(populationSize, dimension);
            for idx = 1 : populationSize/2
                p1 = rouletteWheelSelection(dimension, populationFitness, fitnessSort);
                p2 = rouletteWheelSelection(dimension, populationFitness, fitnessSort);
                while p1 == p2
                    p2 = rouletteWheelSelection(dimension, populationFitness, fitnessSort);
                end
                parent1 = population(p1, :);
                parent2 = population(p2, :);

                offspring1 = blxCrossover(dimension, parent1, parent2, upper, lower);
                offspring2 = blxCrossover(dimension, parent1, parent2, upper, lower);
                % offspring = crossover(dimension, parent1, parent2, upper, lower);

                mutatedOffspring1 = gaussianMutation(dimension, offspring1, mutationRate);
                mutatedOffspring2 = gaussianMutation(dimension, offspring2, mutationRate);

                % offspring1Fitnes = calculateFitness_2005(fitfun, mutatedOffspring1, o, A, M, a, alpha, b);
                % if parentFitness1 > offspring1Fitnes
                %     newPopulation(i * 2 - 1, :) = mutatedOffspring1;
                % else
                %     newPopulation(i * 2 - 1, :) = parent1;
                % end

                % offspring2Fitnes = calculateFitness_2005(fitfun, mutatedOffspring2, o, A, M, a, alpha, b);
                % if parentFitness2 > offspring2Fitnes
                %     newPopulation(i * 2, :) = mutatedOffspring2;
                % else
                %     newPopulation(i * 2, :) = parent2;
                % end

                newPopulation(idx * 2 - 1, :) = mutatedOffspring1;
                newPopulation(idx * 2, :) = mutatedOffspring2;

                % newPopulation(idx, :) = mutatedOffspring1;
            end 
            
            population = newPopulation; 

            populationFitness = calculateFitnessPopulation_2005(fitfun, population, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better) 
            
            % newPopulationFitness = calculateFitnessPopulation_2005(fitfun, newPopulation, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better) 
            % if populationFitness(indComparation) > newPopulationFitness(indComparation)
            %     population(indComparation, :) = newPopulation(indComparation, :);
            %     populationFitness(indComparation) = newPopulationFitness(indComparation);
            % end
            
            bestSolutionFitness = min(populationFitness);
            currentEval = currentEval + populationSize;

            % Your algorithm goes here

        end

        % best individual
        bestSolutionFitness = min(populationFitness);
        fprintf('%dth run, The best individual fitness is %d\n', t, bestSolutionFitness);
        % disp(population)
        % plot(populationFitness);
        % semilogy(populationFitness);
    end

end
