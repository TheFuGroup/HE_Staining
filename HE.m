[fname, fpath, fltidx] = uigetfile (); %opens up a file selection dialogue. select the green/blue colored file to be falsely stained
cd(fpath);
I = double(imread(fname));
F = I(:,:,3);  %nucleus
R = 255-I(:,:,2);  %cytoplasm
newI = zeros(size(I));
newI(:,:,1) = 1 - F/max(max(F))*(1-0.3);
newI(:,:,2) = 1- F/max(max(F))*(1-0.2) - R/max(max(R))*(1-0.55);
newI(:,:,3) = 1- R/max(max(R))*(1-0.88);
newI = uint8(newI*255);
imwrite(newI, append(fname,'_HE.tif')); %writes the HE stained file with _HE.tif appended to the original filename