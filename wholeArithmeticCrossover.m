function [offspring1, offspring2] = wholeArithmeticCrossover(crossoverRate, alpha, parent1, parent2, upper, lower)

    r = rand;
    if r < crossoverRate
        offspring1 = alpha.*parent1 + (1-alpha).*parent2;
        offspring2 = alpha.*parent2 + (1-alpha).*parent1;

        upp = find(offspring1 > upper);
        offspring1(upp) = upper;
        low = find(offspring1 < lower);
        offspring1(low) = lower;

        upp = find(offspring2 > upper);
        offspring2(upp) = upper;
        low = find(offspring2 < lower);
        offspring2(low) = lower;
    else
        offspring1 = parent1;
        offspring2 = parent2;
    end

end
