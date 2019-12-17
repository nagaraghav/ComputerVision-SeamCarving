

function view_seam(im, seam, seamDirection)
    
    if strcmp(seamDirection, 'VERTICAL')
        
        [~, row] = size(seam);
        
        figure;
        imshow(im);
        hold on;
         plot(seam, 1:row, 'r*', 'LineWidth', 1, 'MarkerSize', 1);
        
   
        
    else
        [column, ~] = size(seam);
  
         figure;
        imshow(im);
        hold on;
        plot(1:column, seam, 'r*', 'LineWidth', 1, 'MarkerSize', 1);
    end
    
end