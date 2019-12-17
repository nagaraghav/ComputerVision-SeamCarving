

function verticalSeam = greedy_find_vertical_seam(energyImg)
   [m,n] = size(energyImg);
   
   vert = zeros(1,m);
     
   
   vert(1) = min(energyImg(1,:));
   
   [~, minColofLastRow] = min(energyImg(1,:));
   
   for i=2:1:m
       
       if(minColofLastRow == 1)
           
           [~, pos] = min([energyImg(i,minColofLastRow), energyImg(i,minColofLastRow+1)]);
          

           
           if pos == 1
               minColofLastRow = minColofLastRow;
           end

           if pos == 2
               minColofLastRow = minColofLastRow + 1;
           end
           
            vert(i) = minColofLastRow;
       
       elseif(minColofLastRow == n)
              [~, pos] = min([energyImg(i,minColofLastRow),energyImg(i,minColofLastRow -1)]);
          


           if pos == 1
               minColofLastRow = minColofLastRow;
           end

           if pos == 2
               minColofLastRow = minColofLastRow - 1;
           end
           
           vert(i) = minColofLastRow;
       else   
           
           [~, pos] = min([energyImg(i,minColofLastRow),energyImg(i,minColofLastRow -1) ,energyImg(i,minColofLastRow+1)]);
           
           if pos == 1
               minColofLastRow = minColofLastRow;
           end
           if pos == 2
               minColofLastRow = minColofLastRow - 1;
           end
           if pos == 3
                minColofLastRow = minColofLastRow + 1;
           end
           
           vert(i) = minColofLastRow;
       
   end
   
   verticalSeam = vert;
    disp(vert);
end
