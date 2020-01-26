function [o1, o2] = simpleArithmeticCrossover(a, p1, p2)
    
    k = randi([1, numel(p1) - 1]);

    x = p2(k+1:end);
    y = p1(k+1:end);

    o1 = [p1(1:k) a.*x + (1-a).*y];
    o2 = [p2(1:k) a.*y + (1-a).*x];

end
