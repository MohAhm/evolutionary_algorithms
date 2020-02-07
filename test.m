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
populationSize = 150; % Adjust this to your algorithm

% tournamentSize = 5;
% elitism = 24;
crossoverAlpha = 0.5;
crossoverRate = 0.8;
mutationRate = 0.2;

selectionratio = 1;

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

        % [fitnessSort, indexsort] = sort(populationFitness);
        % population = population(indexsort, :);
        % disp(population)

        % p1 = rouletteWheelSelection(dimension, fitnessSort);
        % father = population(p1, :);
        % % fprintf('Father: ');
        % disp(father)

        % p2 = rouletteWheelSelection(dimension, fitnessSort);
        % while p1 == p2
        %     p2 = rouletteWheelSelection(dimension, fitnessSort);
        % end
        % mother = population(p2, :);
        % fprintf('Mother: ');
        % disp(mother)

        % [offspring1, offspring2] = simpleArithmeticCrossover(crossoverRate, crossoverAlpha, father, mother, upper, lower);
        % offspring1 = crossover(dimension, father, mother, upper, lower);
        % offspring1 = blxCrossover(dimension, father, mother, crossoverAlpha);
        % fprintf('Offspring: ');
        % disp(offspring1)
        % offspring1Fitnes = calculateFitness_2005(fitfun, offspring1, o, A, M, a, alpha, b)

        % Algorithm loop

        while (objetiveValue < bestSolutionFitness && currentEval < maxEval)

            % Your algorithm goes here

            populationFitness = calculateFitnessPopulation_2005(fitfun, population, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better)
            % bestSolutionFitness = min(populationFitness);
            currentEval = currentEval + populationSize;

            %% Sort population
            [fitnessSort, indexsort] = sort(populationFitness);
            population = population(indexsort, :);

            %select the top selectionratio % of the total population
            % indexselect = 1:floor(populationSize * selectionratio);
            % nselect = length(indexselect);

            % %shuffle the order of selected chromosomes
            % Indexselect = indexselect(randperm(nselect));

            % %divide into two pools
            % indexmales = indexselect(1:floor(nselect / 2));
            % indexfemales = indexselect(1 + floor(nselect / 2):end);

            % nchildren = floor(nselect / 2) * 2;
            % offsprings = zeros(nchildren, dimension);

            % for i = 1:length(indexmales)
            %     % father = population(indexmales(i), :);
            %     % mother = population(indexfemales(i), :);

            %     p1 = rouletteWheelSelection(dimension, fitnessSort);
            %     father = population(p1, :);
            %     p2 = rouletteWheelSelection(dimension, fitnessSort);
            %     mother = population(p2, :);

            %     %perform crossover
            %     % [offspring1, offspring2] = simpleArithmeticCrossover(crossoverRate, crossoverAlpha, father, mother, upper, lower);
            %     offspring1 = crossover(dimension, father, mother, upper, lower);
            %     offspring2 = crossover(dimension, father, mother, upper, lower);

            %     %  Mutate the individual
            %     offspring1 = gaussianDistributionMutation(mutationRate, offspring1);
            %     offspring2 = gaussianDistributionMutation(mutationRate, offspring2);

            %     fatherFitnes = calculateFitness_2005(fitfun, father, o, A, M, a, alpha, b);
            %     offspring1Fitnes = calculateFitness_2005(fitfun, offspring1, o, A, M, a, alpha, b);
            %     if fatherFitnes > offspring1Fitnes
            %         offsprings(i * 2 - 1, :) = offspring1;
            %     else
            %         offsprings(i * 2 - 1, :) = father;
            %     end

            %     motherFitnes = calculateFitness_2005(fitfun, mother, o, A, M, a, alpha, b);
            %     offspring2Fitnes = calculateFitness_2005(fitfun, offspring2, o, A, M, a, alpha, b);
            %     if motherFitnes > offspring2Fitnes
            %         offsprings(i * 2, :) = offspring2;
            %     else
            %         offsprings(i * 2, :) = mother;
            %     end

            %     % offsprings(i * 2 - 1, :) = offspring1;
            %     % offsprings(i * 2, :) = offspring2;
            % end

            % newPopulation = population;
            % newPopulation(end - nchildren + 1:end, :) = offsprings;
            % % newPopulationFitness = calculateFitnessPopulation_2005(fitfun, newPopulation, o, A, M, a, alpha, b);
            % population = newPopulation;

            % for indComparation = 1:populationSize

            %     if populationFitness(indComparation) > newPopulationFitness(indComparation)
            %         population(indComparation, :) = newPopulation(indComparation, :);
            %         populationFitness(indComparation) = newPopulationFitness(indComparation);
            %     end

            % end

            % offsprings = zeros(populationSize, dimension);

            for idx = 1:populationSize
                p1 = rouletteWheelSelection(dimension, fitnessSort);
                p2 = rouletteWheelSelection(dimension, fitnessSort);
                % while p1 == p2
                %     p1 = rouletteWheelSelection(dimension, fitnessSort);
                %     p2 = rouletteWheelSelection(dimension, fitnessSort);
                % end
                parent1 = population(p1, :);
                parent2 = population(p2, :);

                offspring = blxCrossover(dimension, parent1, parent2, crossoverAlpha, upper, lower);

                offspring = gaussianDistributionMutation(mutationRate, offspring);


                % currentFitnes = calculateFitness_2005(fitfun, population(idx, :), o, A, M, a, alpha, b);
                % offspring1Fitnes = calculateFitness_2005(fitfun, offspring, o, A, M, a, alpha, b);
                % if currentFitnes > offspring1Fitnes
                %     population(idx, :) = offspring;
                % end

                population(idx, :) = offspring;
            end

            % population = offsprings;
            
            % idx = 1;
            % while idx < populationSize

                %  Select individual
                % p1 = tournamentSelection(populationFitness, populationSize, tournamentSize);
                % parent1 = population(p1, :);
                % p2 = tournamentSelection(populationFitness, populationSize, tournamentSize);
                % parent2 = population(p2, :);
                % p1 = rouletteWheelSelection(dimension, fitnessSort);
                % p2 = rouletteWheelSelection(dimension, fitnessSort);

                % while p1 == p2
                %     p1 = rouletteWheelSelection(dimension, fitnessSort);
                %     p2 = rouletteWheelSelection(dimension, fitnessSort);
                % end

                % parent1 = population(p1, :);
                % parent2 = population(p2, :);

                %  Apply crossover
                % [offspring1, offspring2] = simpleArithmeticCrossover(crossoverRate, crossoverAlpha, parent1, parent2, upper, lower);
                % offspring1 = crossover(dimension, parent1, parent2, upper, lower);
                % offspring2 = crossover(dimension, parent1, parent2, upper, lower);
                % offspring1 = blxCrossover(dimension, parent1, parent2, crossoverAlpha, upper, lower);
                % offspring2 = blxCrossover(dimension, parent1, parent2, crossoverAlpha, upper, lower);

                %  Mutate the individual
                % offspring1 = gaussianDistributionMutation(mutationRate, offspring1);
                % offspring2 = gaussianDistributionMutation(mutationRate, offspring2);

                % parent1Fitnes = calculateFitness_2005(fitfun, parent1, o, A, M, a, alpha, b);
                % offspring1Fitnes = calculateFitness_2005(fitfun, offspring1, o, A, M, a, alpha, b);
                % if parent1Fitnes > offspring1Fitnes
                %     population(idx, :) = offspring1;
                % else
                %     population(idx, :) = parent1;
                % end

                % parent2Fitnes = calculateFitness_2005(fitfun, parent2, o, A, M, a, alpha, b);
                % offspring2Fitnes = calculateFitness_2005(fitfun, offspring2, o, A, M, a, alpha, b);
                % if parent2Fitnes > offspring2Fitnes
                %     population(idx + 1, :) = offspring2;
                % else
                %     population(idx + 1, :) = parent2;
                % end

                % Place the resulting chromosomes into the population
                % offsprings(idx, :) = offspring1;
                % population(idx + 1, :) = offspring2;

            %     idx = idx + 1;
            % end

            

            % Your algorithm goes here

        end

        % disp(offsprings)

        % best individual
        bestSolutionFitness = min(populationFitness);
        fprintf('%dth run, The best individual fitness is %d\n', t, bestSolutionFitness);

        % disp(population)

        % theIndividual = find(populationFitness==bestSolutionFitness, 1, 'first');
        % disp(population(theIndividual, :))

        % disp(populationFitness);

    end

end
