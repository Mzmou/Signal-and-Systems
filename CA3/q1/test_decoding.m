mapset=Build_mapset();
input=imread('Amsterdam.jpg');
coded=coding('signal;', input, mapset);
decoding(coded,mapset,35);