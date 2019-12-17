
im = imread('inputSeamCarvingPrague.jpg');
figure;
imshow(im);
truesize;


for i=1:50
    
    energyImage = energy_img(im);
   
    seamDirection = 'HORIZONTAL';

    cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
    
    reducedColorImg = decrease_height(im, energyImage);
    im = reducedColorImg;
end

figure;
imshow(im,'InitialMagnification','fit');
truesize;

imwrite(im, 'outputReduceHeightMall.png');



