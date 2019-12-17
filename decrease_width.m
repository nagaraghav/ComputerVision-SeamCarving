
function [reducedColorImg, reducedEnergyImg] = decrease_width(im, energyImg)
    
    my_direction = 'VERTICAL'
    cumulativeEnergy = cumulative_min_energy_map(energyImg, my_direction);
    
    verticalSeam = find_vertical_seam(cumulativeEnergy);
    
    [r, c, rgb] = size(im);
    newImg = uint8(double(zeros(r, c-1, rgb)));

    for i=1:r
        j = verticalSeam(i);
        newImg(i,1:j-1,:) = im(i,1:j-1,:);
        newImg(i,j:c-1,:) = im(i,j+1:c,:);

    end

    reducedColorImg = newImg;
    
    reducedEnergyImg = energy_img(newImg);

end
