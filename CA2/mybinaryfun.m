 function binary_image = mybinaryfun(input_image , threshold)

binary_image=ones(size(input_image));
binary_image(input_image>threshold)=0;
end
