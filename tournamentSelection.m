
% Create tournament population


function tournament = tournamentSelection(dimension, tournamentSize, population)
    
    tournament = zeros(tournamentSize, dimension);
    
    i = 1;
    while i <= tournamentSize
       a = randi(tournamentSize);
       individual = population(a,:);
       
       if ~ismember(individual, tournament)
            tournament(i,:) = individual;
            i = i + 1;
       end
    end
    
end