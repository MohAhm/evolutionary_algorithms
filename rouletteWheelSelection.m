function idx = rouletteWheelSelection(fitnessSort)

    sumFinesses = sum(fitnessSort);
    rouletteWheelPosition = rand * sumFinesses;
    individualProbabilities = cumsum(fitnessSort);

    for i = 1 : length(individualProbabilities)
        if rouletteWheelPosition <= individualProbabilities(i)
            idx = i;
            break
        else
            idx = i;
        end
    end

end
