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
        
        r_props=graycoprops(r);
        r_props=cell2mat(struct2cell(r_props));
        r_val=r_props';
        
        g_props=graycoprops(g);
        g_props=cell2mat(struct2cell(g_props));
        g_val=g_props';
        
        b_props=graycoprops(b);
        b_props=cell2mat(struct2cell(b_props));
        b_val=b_props';
        
        resMat_R(j,:)=r_val;
        resMat_G(j,:)=g_val;
        resMat_B(j,:)=b_val;
        j=j+1;
    end
end
    [m,n]=kmeans(resMat_R,4);
    for i=1:4
        scatter(n(i,1),n(i,2),"red");
        hold on;
    end
    scatter(resMat_R(:,1),resMat_R(:,2),1.5,"blue");
    hold on;
