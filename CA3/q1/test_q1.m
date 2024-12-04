
mapset =Build_mapset()
input = imread("Amsterdam.jpg");
input = rgb2gray(input);
codedImage = coding ('signal;' , input , mapset);
subplot(1,2,1);
imshow(input);
subplot(1,2,2);
imshow(codedImage);
