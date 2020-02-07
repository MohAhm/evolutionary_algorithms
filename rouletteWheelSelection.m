function parent = rouletteWheelSelection(dimension, fitnessSort)

    sumFinesses = sum(fitnessSort);
    rouletteWheelPosition = rand * sumFinesses;

    individualProbabilities = cumsum(fitnessSort);
    % flipProbabilities = flip(individualProbabilities);
    fitnessSort = flip(fitnessSort);

    for i = 1 : dimension
        % if rouletteWheelPosition >= flipProbabilities(i)
        if rouletteWheelPosition <= individualProbabilities(i)
            parent = i;
            % disp(i)
            break
        else
            parent = i;
        end
    end

end
