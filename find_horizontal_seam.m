function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)    
    
    transCum = transpose(cumulativeEnergyMap);
    [maxRow, maxCol] = size(transCum);
    
    [~, c] = min(transCum(maxRow,:));
    
    horizontalSeam = [];
    
    horizontalSeam(maxRow) = c;   
    
    for i = maxRow-1:-1:1
        
        if c == maxCol 
            [~, pos] = min([transCum(i,c-1), transCum(i,c)]);
            
            if pos ~= 1
                horizontalSeam(i) = c;
            end 
            
            if pos == 1 
                horizontalSeam(i) = c-1;
                c = c - 1;
            end
                  
        elseif c == 1 
            [~, pos] = min([transCum(i,c), transCum(i,c+1)]);
            
            if pos ~= 1
                horizontalSeam(i) = c+1;
                c = c+1;
            end 
            
            if pos == 1
                horizontalSeam(i) = c;
            end
            
            
        else   
            [~, pos] = min([transCum(i,c-1), transCum(i,c), transCum(i,c+1)]);
            
            if pos ~= 1 && pos ~= 2
               horizontalSeam(i) = c+1;
               c = c+1;
            end 
            
            if pos == 2 
                horizontalSeam(i) = c;
            end 
            
            if pos == 1 
                horizontalSeam(i) = c-1;
                c = c - 1;
            end
                
        end
    end
    horizontalSeam = transpose(horizontalSeam);
end
