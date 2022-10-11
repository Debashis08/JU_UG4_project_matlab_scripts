topLevelFolder = 'D:\4TH YEAR\Project_1\CROPPED_ALL_IMAGES\BLACK\DUTA';
files = dir(topLevelFolder);
dirFlags = [files.isdir];
subFolders = files(dirFlags);
subFolderNames = {subFolders(3:end).name};
for k = 1 : length(subFolderNames)
	fprintf('Sub folder #%d = %s\n', k, subFolderNames{k});
    str=append("D:\4TH YEAR\Project_1\CROPPED_ALL_IMAGES\BLACK\DUTA\",subFolderNames{k},"\*.jpg");
    fprintf('%s',str);
    fprintf('\n');
    str_mat(:,k)=str;
end
str_temp=str_mat(:,4);
str_mat(4)=[];
str_mat=[str_temp,str_mat];
j=1;
for k=1:4
    location=str_mat(:,k);
    imageds=imageDatastore(location);
    fullFileName=vertcat(imageds.Files);
    for i=1:length(fullFileName)
        img=readimage(imageds,i);
        [folder, baseFileNameNoExt, ext] = fileparts(fullFileName{i});
        fprintf(baseFileNameNoExt);
        fprintf('\n');
        
        R=img(:,:,1);
        G=img(:,:,2);
        B=img(:,:,3);

        r=graycomatrix(R);
        g=graycomatrix(G);
        b=graycomatrix(B);

        r=reshape(r,1,64);
        g=reshape(g,1,64);
        b=reshape(b,1,64);

        resMat_R(j,:)=r;
        resMat_G(j,:)=g;
        resMat_B(j,:)=b;
        j=j+1;
    end
end