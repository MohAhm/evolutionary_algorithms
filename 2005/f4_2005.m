%
%
%
%
%

function f = f4_2005(x, o, A, M, a, alpha, b)

    [ps, D] = size(x);
    if length(o) >= D
        o = o(1 : D);
    else
        o = -100 + 200 * rand(1, D);
    end
    x = x - repmat(o, ps, 1);
    f = 0;
    for i = 1 : D
        f = f + sum(x(:, 1 : i), 2).^2;
    end
    f = f .* (1 + 0.4 .* abs(normrnd(0, 1, ps, 1)));

end