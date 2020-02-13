function offspring = blxCrossover(dimension, parent1, parent2, upper, lower)
    alpha = 0.5;
    
    for i = 1 : dimension
        Cmax = max(parent1(i), parent2(i));
        Cmin = min(parent1(i), parent2(i));
        I = Cmax - Cmin;

        % generate alpha random number between interval
        % Hk = [Cmin − I*α, Cmax + I*α]
        Hk = ((Cmax + I * alpha) - (Cmin - I * alpha)) .* rand(1,1) + (Cmin - I * alpha);

        if Hk > upper
            offspring(i) = upper;
        elseif Hk < lower
            offspring(i) = lower;
        else
            offspring(i) = Hk;
        end
    end

end