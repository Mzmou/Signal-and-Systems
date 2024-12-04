
load TRAININGSET.mat
%loading picture
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif'},'Choose an image');
s=[path,file];
picture=imread(s);
picture=imresize(picture,[300 500]);
%figure
pic2=mygrayfun(picture);
pic3=mybinaryfun(pic2,80);
pic4=myremovecom(pic3,300);
totalLetters=size(TRAIN,2);




figure

imshow(pic4);
figure
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
    if MAXRO>.47
        out=cell2mat(TRAIN(2,pos));       
        final_output=[final_output out];
    end
end

% Printing the plate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'%s\n',final_output);
fclose(file);




