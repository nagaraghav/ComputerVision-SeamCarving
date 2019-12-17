
im = (uint8(double(imread('water.jpg'))));
em = energy_img(im);
vertGreedySeam = greedy_find_vertical_seam(em);
view_seam(im, vertGreedySeam, 'VERTICAL');

