function x = gaussianDistributionMutation(offspring)
    
    delta = 0.13;
    x = offspring + sqrt(delta) * randn(1);

end