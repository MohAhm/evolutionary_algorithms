path = '/Users/moah11/Documents/AI/evolutionary_algorithms/2005';
addpath(genpath(path))

functions = [1 2 3 4 5 6 7 8 9 10]; %functions being solved
% functions = 1;
% functions = [2 4 9];
numF = size(functions,2);
nTimes = 20; % Number of times in which a function is going to be solved
% nTimes = 1; 
dimension = 30; % Dimension of the problem
% dimension = 7; 
populationSize = 200; % Adjust this to your algorithm


Pc = 0.9; % Pr: Crossover Probability
Pm = 0.45; % Pr: Mutation Probability


for i = 1:numF 

     fitfun = functions(i); %fitfun is the function that we are solving

     fprintf('\n-----  Function %d started  -----\n\n', fitfun);

     for t = 1:nTimes

          maxEval = 10000*dimension; % maximum number of evaluation
          [value, upper,lower,objetiveValue, o, A, M, a, alpha, b] = getInformation_2005(fitfun, dimension);

          currentEval = 0;

          % Start generating the initial population

          population = zeros(populationSize, dimension);

          for j =1:populationSize

               population(j,:) = lower + (upper-lower).*rand(1,dimension);

          end

          % disp(population)

          populationFitness = calculateFitnessPopulation_2005(fitfun, population, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better)
          bestSolutionFitness = min(populationFitness);
          currentEval = currentEval + populationSize;

          % Algorithm loop

          while(objetiveValue < bestSolutionFitness && currentEval < maxEval)

               % Your algorithm goes here

               % Sort population
               [fitnessSort, indexsort] = sort(populationFitness);
               population = population(indexsort, :);

               newPopulation = zeros(populationSize, dimension);

               for idx = 1 : populationSize
                    % GA - Selection
                    p1 = rouletteWheelSelection(fitnessSort);
                    p2 = rouletteWheelSelection(fitnessSort);
                    while p1 == p2
                         p2 = rouletteWheelSelection(fitnessSort);
                    end
                    parent1 = population(p1, :);
                    parent2 = population(p2, :);

                    % GA - Crossover
                    offspring = blxCrossover(parent1, parent2, Pc);
                    
                    % GA - Mutation
                    mutatedOffspring = gaussianMutation(offspring, Pm);

                    % GA - Replacement, accept the offspring if its fitness is better 
                    offspringFitness = calculateFitness_2005(fitfun, mutatedOffspring, o, A, M, a, alpha, b);
                    if offspringFitness < populationFitness(idx)
                         newPopulation(idx, :) = mutatedOffspring;
                    else
                         newPopulation(idx, :) = population(idx, :);
                    end
               end

               population = newPopulation;

               populationFitness = calculateFitnessPopulation_2005(fitfun, population, o, A, M, a, alpha, b); %Fitness values of all individuals (smaller value is better)
               bestSolutionFitness = min(populationFitness);
               currentEval = currentEval + populationSize;
               
               % Your algorithm goes here
               
          end

          % disp(population)

          % best individual
          bestSolutionFitness = min(populationFitness);
          bestSolutions(t) = bestSolutionFitness;
          fprintf('%dth run, The best individual fitness is %d\n', t, bestSolutionFitness);

     end

     meanValue = mean(bestSolutions);
     fprintf('Mean value: %d\n', meanValue);

end
