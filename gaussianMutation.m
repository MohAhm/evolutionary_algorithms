function mutatedOffspring = gaussianMutation(dimension, offspring, mutationRate)
    delta = 0.1;

    for i = 1 : dimension
        if rand < mutationRate  
            mutatedOffspring(i) = offspring(i) + sqrt(delta) * randn(1);
        else
            mutatedOffspring(i) = offspring(i);
        end
    end         

end
