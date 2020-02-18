function offspring = blxCrossover(parent1, parent2, Pc)
    alpha = 0.45;
    
    if rand < Pc
        for i = 1 : length(parent1)
            Cmax = max(parent1(i), parent2(i));
            Cmin = min(parent1(i), parent2(i));
            I = Cmax - Cmin;
    
            % Hk: [Cmin − I*α, Cmax + I*α]
            offspring(i) = (Cmin - I * alpha) + ((Cmax + I * alpha) - (Cmin - I * alpha)) .* rand(1,1);
        end        
    else
        offspring = parent1;
    end


end