im = imread('InputSeamCarvingPrague.jpg');

em = energy_img(im);

cmap = cumulative_min_energy_map(em, 'VERTICAL');
vertSeam = find_vertical_seam(cmap);

view_seam(im, vertSeam, 'VERTICAL');

im = imread('InputSeamCarvingPrague.jpg');

em = energy_img(im);

cmap = cumulative_min_energy_map(em, 'HORIZONTAL');
vertSeam = find_horizontal_seam(cmap);

view_seam(im, vertSeam, 'HORIZONTAL');
