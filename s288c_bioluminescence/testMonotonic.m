function sorted = testMonotonic(fluxes)

incr = []; decr = []; zero = []; neither = [];

for i=1:length(fluxes)        
    temp = fluxes(i,:);
    diffVec = diff(temp);
    
    if (diffVec(:)>0)
        incr = [incr i];
    elseif (diffVec(:) <0)
        decr = [decr i];
    elseif (diffVec(:)== 0)
        zero = [zero i];
    else
        neither = [neither i];
    end
    
end

sorted = struct('incr',incr,'decr',decr,'zero',zero, 'neither', neither);
end


    