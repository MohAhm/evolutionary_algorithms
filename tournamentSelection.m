
% Create tournament population
% population(i) == populationFitness(i)


function parent = tournamentSelection(populationFitness, populationSize, tournamentSize)
    
    % returns k (tournamentSize) values randomly, 
    % from the integers 1 to n (populationSize).
    indices = randsample(populationSize, tournamentSize);
    
    % select values of the randomly generated indices 
    % form the populationFitness, then select the fittest.
    tournament = populationFitness(indices);
    fittest = min(tournament);

    % find the index of the fittest in the 
    % tournament population from populationFitness
    parent = find(populationFitness==fittest, 1, 'first');
    
end