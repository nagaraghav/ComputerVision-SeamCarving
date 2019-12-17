function cumulativeEnergyMap = cumulative_min_energy_map(energyImg, seamDirection)
    
     strVert = 'VERTICAL';
     strHor = 'HORIZONTAL';
     
     [m,n] = size(energyImg);
     
     
    if strcmp(seamDirection, strVert)
        verticalImage = double(zeros(size(energyImg)));
        verticalImage(1,:) = energyImg(1,:);

        for i = 2:m
         for j = 1:n
             
             if j ~= 1 && j ~= n
                 verticalImage(i,j) = min([verticalImage(i-1, j-1),verticalImage(i-1,j),verticalImage(i-1,j+1)]);
             end 
             
             if j == n 
                 verticalImage(i,j) = min([verticalImage(i-1, j),verticalImage(i-1,j-1)]);
             end 
             
             if j == 1 
                 verticalImage(i,j) =  min([verticalImage(i-1,j),verticalImage(i-1,j+1)]);
             end
               
             verticalImage(i,j) = verticalImage(i,j) + energyImg(i,j);
             
         end 
        end

        cumulativeEnergyMap = verticalImage;
    end
        
    if strcmp(seamDirection,strHor)
       horizontalImage = double(zeros(size(energyImg)));
       horizontalImage(:,1) = energyImg(:,1);
       
       for j = 2:n
         for i = 1:m
             
             if i ~= m && i ~= 1 
                 horizontalImage(i,j) = energyImg(i,j) + min([horizontalImage(i-1, j-1),horizontalImage(i,j-1),horizontalImage(i+1,j-1)]);
             end 
             
             if i == m 
                 horizontalImage(i,j) = energyImg(i,j) + min([horizontalImage(i-1, j-1),horizontalImage(i,j-1)]);
             end 
             
             if i == 1 
                 horizontalImage(i,j) = energyImg(i,j) + min([horizontalImage(i,j-1),horizontalImage(i+1,j-1)]);
             end 
                
         end
       end
        
        cumulativeEnergyMap = horizontalImage;

    end
   

end
