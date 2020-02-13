function parent = rouletteWheelSelection(dimension, populationFitness, fitnessSort)

    sumFinesses = sum(fitnessSort);
    rouletteWheelPosition = rand * sumFinesses;

    individualProbabilities = cumsum(fitnessSort);
    fitnessSort = flip(fitnessSort);

    for i = 1 : dimension
        if rouletteWheelPosition <= individualProbabilities(i)
            idx = find(populationFitness == fitnessSort(i), 1, 'first');
            parent = idx;
            break
        else
            idx = find(populationFitness == fitnessSort(i), 1, 'first');
            parent = idx;
        end
    end

end
