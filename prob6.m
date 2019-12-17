close all;
im1 = uint8(double(imread('tchalla.jpeg'))); 

subplot(2,2,1); 
imshow(im1);
title('original');
disp('Original Image: ');
disp(size(im1));


im = im1;
for i=1:150 
    
     eimg = energy_img(im); 
        reduced_color_img = decrease_width(im, eimg); 
        im = reduced_color_img; 
    if i < 11
        eimg = energy_img(im); 
    reduced_color_img = decrease_height(im, eimg); 
    im = reduced_color_img; 
    end 
end 

disp('Our Image: ');
disp(size(im));


subplot(2,2,2);  

imshow(im);
title('our system');


subplot(2,2,3); 
[x,y,rgb] = size(im1); 
newimg = imresize(im1,[(x-10) (y-150)]); 

imshow(newimg);
title('resize');

disp('Resized image: ');
disp(size(newimg));








