function mutatedOffspring = gaussianMutation(offspring, Pm)
    delta = 0.1;

    if rand < Pm 
        for i = 1 : length(offspring)
            mutatedOffspring(i) = offspring(i) + sqrt(delta) * randn(1);         
        end   
    else
        mutatedOffspring = offspring;
    end

end
