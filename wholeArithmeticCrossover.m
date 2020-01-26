function [o1, o2] = wholeArithmeticCrossover(a, p1, p2)

    o1 = a.*p1 + (1-a).*p2;
    o2 = a.*p2 + (1-a).*p1;

end
