function [o1, o2] = singleArithmeticCrossover(a, p1, p2)
    
    k = randi([1, numel(p1) - 1]);

    x = p1(k);
    y = p2(k);

    o1 = [p1(1:k-1) a*x + (1-a)*y p1(k+1:end)];
    o2 = [p2(1:k-1) a*y + (1-a)*x p2(k+1:end)];

end
