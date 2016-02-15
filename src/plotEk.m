for m=2:129
        
    for i=1:129
        for j=1:129
            for k=1:129
                 if ((sqrt( i^2 + j^2 + k^2 ) > f(m-1))&&(sqrt( i^2 + j^2 + k^2 ) < f(m)))               
                 Ek(m) = Ek(m)+abs(Y(i,j,k)); 
                end
            end
        end   
    end
    Ek(m) = Ek(m)/(4*pi*m^2);
    end