function offspring = singleArithmeticCrossover(parent1, parent2, Pc)
    alpha = 0.5;

    if rand < Pc
        k = randi([1, numel(parent1) - 1]);

        x = parent1(k);
        y = parent2(k);

        offspring = [parent1(1:k-1) alpha*x + (1-alpha)*y parent1(k+1:end)];
    else
        offspring = parent1;
    end

end
