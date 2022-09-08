
location='D:\Test_work\ADULTERATION\*.jpg';
imageds=imageDatastore(location);
fullFileName=vertcat(imageds.Files);
for i=1:length(fullFileName)
    img=readimage(imageds,i);
    [folder, baseFileNameNoExt, ext] = fileparts(fullFileName{i});
    baseFileNameNoExt=baseFileNameNoExt(1:end-2);
    str=append("D:\Test_work\Cur_temp\",baseFileNameNoExt,"0",string(i+20),".jpg");
    imwrite(img,str);
end