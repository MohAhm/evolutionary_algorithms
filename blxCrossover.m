function offspring = blxCrossover(dimension, p1, p2, a, upper, lower)

    for i = 1 : dimension
        maxVal = max(p1(i), p2(i));
        minVal = min(p1(i), p2(i));
        interval = maxVal - minVal;

        gene = (minVal - interval * a) + ((maxVal + interval * a) - (minVal - interval * a));

        if gene > upper
            offspring(i) = upper;
        elseif gene < lower
            offspring(i) = lower;
        else
            offspring(i) = gene;
        end
    end

end