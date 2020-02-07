function mutatedOffspring = gaussianDistributionMutation(mutationRate, offspring)
    delta = 0.13;

    r = rand;
    if r < mutationRate    
        for i = 1:length(offspring)
            mutatedOffspring(i) = offspring(i) + sqrt(delta) * randn(1);
        end
    else
        mutatedOffspring = offspring;
    end

end
