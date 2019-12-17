function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
    
    [height, width] = size(cumulativeEnergyMap); 


    my_seam = double(zeros(height,1));


    [~,my_seam(height)] = min(cumulativeEnergyMap(height,:));

    for i=height-1:-1:1
              if(my_seam(i+1)-1 > 1)
                  p=my_seam(i+1)-1;
              elseif (my_seam(i+1)-1 <= 1)
                  p=1;
              end
              
              if(my_seam(i+1) + 1 > width)
                  q=width;
              elseif (my_seam(i+1) + 1 <= width)
                  q=my_seam(i+1)+1;
              end 
              
              col = p:q;
              [~,indexvector]= min(cumulativeEnergyMap(i,col));
              my_seam(i)=indexvector + p - 1;
    end
    verticalSeam = my_seam;
end