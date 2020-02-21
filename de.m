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
populationSize = 20; % Adjust this to your algorithm


F = 0.7; % F: Scaling Factor
Pr = 0.5; % Pr: Recombination Probability


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

               newPopulation = zeros(populationSize, dimension);

               for idx = 1 : populationSize
                    % DE - Mutation
                    Xr = randperm(populationSize, 3);
                    mutatedOffspring = population(Xr(1),:) + F * (population(Xr(2),:) - population(Xr(3),:));

                    % DE - Recombination
                    individual = population(idx, :);

                    for gene = 1 : dimension
                         if rand < Pr || gene == randi(dimension)
                              offspring(gene) = mutatedOffspring(gene);
                         else
                              offspring(gene) = individual(gene);
                         end
                    end

                    % DE - Selection
                    offspringFitness = calculateFitness_2005(fitfun, offspring, o, A, M, a, alpha, b);
                    if offspringFitness < populationFitness(idx)
                         newPopulation(idx, :) = offspring;
                    else
                         newPopulation(idx, :) = individual;
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
