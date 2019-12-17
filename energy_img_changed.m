function energyImg = energy_img_changed(im)


newImg = imgaussfilt(im,17);
grey_im = rgb2gray(newImg);
[dx,dy] = imgradient(grey_im);

energy = sqrt((dx.^2)+(dy.^2));

energyImg = energy;
end
