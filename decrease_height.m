
function [reducedColorImg, reducedEnergyImg] = decrease_height(im,energyImg)
    
    my_direction = 'HORIZONTAL';
    
    cumulativeEnergy = cumulative_min_energy_map(energyImg, my_direction);
    horizontalSeam = find_horizontal_seam(cumulativeEnergy);
    
    im = permute(im, [2 1 3]);
    
    [r, c, rgb] = size(im);
    
    new_color_image = uint8(double(zeros(r, c-1, rgb)));

    for i =1:r
        j = horizontalSeam(i);
        new_color_image(i,1:j-1,1:3) = im(i,1:j-1,1:3);
        new_color_image(i,j:c-1,1:3) = im(i,j+1:c,1:3);

    end
    
    new_color_image = permute(new_color_image, [2 1 3]);
    
    reducedEnergyImg = energy_img(new_color_image);
    reducedColorImg = new_color_image;

end
