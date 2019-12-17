im = (uint8(double(imread('inputSeamCarvingPrague.jpg'))));

energyImage = energy_img(im);
figure;
imagesc(energyImage);
imwrite(energyImage, 'energyPrague.png');


seamDirection = 'HORIZONTAL';

cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
 
figure;
imagesc(cumulativeEnergyMap);
imwrite(im, 'horizCumEnergyPrague.png');

seamDirection = 'VERTICAL';

cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);
 
figure;
imagesc(cumulativeEnergyMap);
imwrite(im, 'vertCumEnergyPrague.png');