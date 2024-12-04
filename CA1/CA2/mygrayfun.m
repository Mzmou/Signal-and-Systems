function output_image =  mygrayfun(input_picture) 

if size(input_picture,3)==3
    output_image= 0.2989*input_picture(:,:,1) + 0.5870 * input_picture(:,:,2) +0.1140 * input_picture(:,:,3);
else 
    output_image=input_picture;

end
output_image = uint8(output_image);
end