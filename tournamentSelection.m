
function p = tournamentSelection(populationFitness, populationSize, K)

    indexSelect = randperm(populationSize, K); % k randomly selected indices
    fitness = populationFitness(indexSelect); % the individuals of the selected indices

    tournament = containers.Map(fitness, indexSelect);
    p = tournament(min(fitness));
    
end
