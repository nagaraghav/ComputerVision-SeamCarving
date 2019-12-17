function energyImg = energy_img(im)
 
    grey_im = rgb2gray(im); 
    [dx,dy] = imgradient(grey_im);  

    eng = sqrt((dx.^2)+(dy.^2));
    energyImg = eng;
    
end
