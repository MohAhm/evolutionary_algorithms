function [offspring1, offspring2] = simpleArithmeticCrossover(crossoverRate, alpha, parent1, parent2, upper, lower)
    
    r = rand;
    if r < crossoverRate
        k = randi([1, numel(parent1) - 1]);

        x = parent2(k+1:end);
        y = parent1(k+1:end);

        offspring1 = [parent1(1:k) alpha.*x + (1-alpha).*y];
        offspring2 = [parent2(1:k) alpha.*y + (1-alpha).*x];

        % upp = find(offspring1 > upper);
        % offspring1(upp) = upper;
        % low = find(offspring1 < lower);
        % offspring1(low) = lower;

        % upp = find(offspring2 > upper);
        % offspring2(upp) = upper;
        % low = find(offspring2 < lower);
        % offspring2(low) = lower;

    else
        offspring1 = parent1;
        offspring2 = parent2;
    end

end
