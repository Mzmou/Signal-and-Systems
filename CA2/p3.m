clc;
clear;
load TRAININGSET2.mat
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
picture=imresize(picture,[400 600]);
loc = mask(picture);
Final = numberplate(picture, loc);
%figure
%imshow(loc)
figure
imshow(Final)

picture=imresize(Final,[300 500]);
%figure
pic2=mygrayfun(picture);
pic3=mybinaryfun(pic2,100);
pic4=myremovecom(pic3,30);
totalLetters=size(TRAIN,2);




figure
imshow(pic4);
imshow(pic3);
pic4=imresize(pic4,[500,500]);
pic5=mysegmentation(pic4);


final_output=[];
t=[];
for n=1:max(pic5(:))
    [r,c] = find(pic5==n);
    Y=pic4(min(r):max(r),min(c):max(c));
    Y=imresize(Y,[42,24]);
     %figure
    % imshow(Y)
     
    
    
    

 ro=zeros(1,totalLetters);
    for k=1:totalLetters   
        ro(k)=corr2(TRAIN{1,k},Y);
    end
    if n==7
        saeed=1;
    end
    [MAXRO,pos]=max(ro);
    if MAXRO>.8
        out=cell2mat(TRAIN(2,pos));       
        final_output=[final_output out];
    end
end
fprintf('final result:%s',final_output)
% Printing the plate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);


function loc = mask(picture)

%RGB2GRAY & BINARIZE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imgray = rgb2gray(picture);
threshold = graythresh(imgray);


% EDGING & FILLING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
edgepic = edge(imgray, 'prewitt');
edgepic = imclearborder(edgepic);
imfilled = imfill(edgepic,'holes');
loc = bwareaopen(imfilled,600);
end


%Below steps are to find location of number plate
function Final = numberplate(picture, loc)
regions = regionprops(loc,'BoundingBox','Area');
pixels = regions.Area;
count = numel(regions);
max = pixels;
boundingBox = regions.BoundingBox;
for i = 1:count
   if max < regions(i).Area
       max = regions(i).Area;
      boundingBox = regions(i).BoundingBox;
    
 %{ 
   [l, w] = size(boundingBox);
   if 3 < (l/w) && (l/w) < 5
       if abs((l/w) - 4) < abs(ratio - 4)
           boundingBox = regions(i).BoundingBox;
       end
      
   end
    %}  
    end 
end   

Final = imcrop(picture, boundingBox);

end
