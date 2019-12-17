
im = imread('inputSeamCarvingPrague.jpg');
figure;
imshow(im);
truesize;


for i=1:100
    energyImage = energy_img(im);
    seamDirection = 'VERTICAL';

    cumulativeEnergyMap = cumulative_min_energy_map(energyImage, seamDirection);

    reducedColorImg = decrease_width(im, energyImage);
    im = reducedColorImg;
end

figure;
imshow(im,'InitialMagnification','fit');
truesize;


imwrite(im, 'outputReduceWidthMall.png');

