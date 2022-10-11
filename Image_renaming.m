
location='D:\4TH YEAR\Project_1\Images_Backup\Image_Folders_Collected\Debashis\WHITE\SUNRISE\1-4\*.jpg';
imageds=imageDatastore(location);
fullFileName=vertcat(imageds.Files);
for i=1:length(fullFileName)
    img=readimage(imageds,i);
    if(i>9)
        str=append("D:\4TH YEAR\Project_1\CUR_ALL_IMAGES\WHITE\SUNRISE\1-4\","W_SU_1-4_","0",string(i),".jpg");
        imwrite(img,str);
    else
        str=append("D:\4TH YEAR\Project_1\CUR_ALL_IMAGES\WHITE\SUNRISE\1-4\","W_SU_1-4_","00",string(i),".jpg");
        imwrite(img,str);
    end
end