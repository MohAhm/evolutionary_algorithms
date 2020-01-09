%
%        DATABASE INFORMATION 
%
%  1999 -> 1-13 functions
%


function res = calculateFitness_2005(func, x, o, A, M, a, alpha, b)

    dimension = size(x,2);

    if func == 1
    
        res = f1_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 2
    
        res = f2_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 3
    
        res = f3_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 4
    
        res = f4_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 5
    
        res = f5_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 6
    
        res = f6_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 7
    
        res = f7_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 8
    
        res = f8_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 9
    
        res = f9_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 10
    
        res = f10_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 11
    
        res = f11_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 12
    
        res = f12_2005(x, o, A, M, a, alpha, b);
        
    end
    
    if func == 13
    
        res = f13_2005(x, o, A, M, a, alpha, b);
        
    end


end