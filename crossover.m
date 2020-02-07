function child = crossover(dimension, p1, p2, upper, lower)
    alp = 0.5;

    for i = 1 : dimension
        minFrame = min(p1(i), p2(i));
        maxFrame = max(p1(i), p2(i));
        difference = maxFrame - minFrame;

        randGene = ((maxFrame+difference*alp)-(minFrame-difference*alp)).*rand + (minFrame-difference*alp);
        child(i) = randGene;

        if child(i) > upper
            child(i) = upper;
        else
            if child(i) < lower
                child(i) = lower;
            end
        end

    end

end