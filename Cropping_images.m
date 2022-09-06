
location='D:\4TH YEAR\Project_1\ALL_IMAGES\BLACK\DUTA\1-1\*.jpg';
imageds=imageDatastore(location);
fullFileName=vertcat(imageds.Files);
for i=1:5
    img=readimage(imageds,i);
    [j,rectangle]=imcrop(img);
    croppedimage=imcrop(img,rectangle);
    [folder, baseFileNameNoExt, ext] = fileparts(fullFileName{i});
    fprintf(baseFileNameNoExt);
    fprintf('\n');
    str=append("D:\4TH YEAR\Project_1\CROPPED_ALL_IMAGES\BLACK\DUTA\1-1",'\CR_',baseFileNameNoExt,".jpg");
    imwrite(croppedimage,str);
end