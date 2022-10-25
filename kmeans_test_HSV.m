topLevelFolder = 'D:\4TH YEAR\Project_1\CROPPED_ALL_IMAGES\BLACK\SUNRISE';      %%top level folder name should be same here and ...
files = dir(topLevelFolder);
dirFlags = [files.isdir];
subFolders = files(dirFlags);
subFolderNames = {subFolders(3:end).name};
for k = 1 : length(subFolderNames)
	fprintf('Sub folder #%d = %s\n', k, subFolderNames{k});
    str=append("D:\4TH YEAR\Project_1\CROPPED_ALL_IMAGES\BLACK\SUNRISE\",subFolderNames{k},"\*.jpg");      %%...here
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
        hsvImage=rgb2hsv(img);
        R=hsvImage(:,:,1);
        G=hsvImage(:,:,2);
        B=hsvImage(:,:,3);

        r=graycomatrix(R,'offset',[-1 -1]);   %%|
        g=graycomatrix(G,'offset',[-1 -1]);   %%|---set the offsets to the desired offset values
        b=graycomatrix(B,'offset',[-1 -1]);   %%|
        
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
     
resMat_RGB=[resMat_R resMat_G resMat_B];
excelSheetLocation='D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE_HSV\135_Degree_GLCM\'; %%<--change this folder name to the desired folder name...according to the offset applied...
for i=1:4
    if i==1
        [m,n]=kmeans(resMat_R,4);
        sheet_path=append(excelSheetLocation,'R_m','.xlsx');
        writematrix(m,sheet_path);
        sheet_path=append(excelSheetLocation,'R_n','.xlsx');
        writematrix(n,sheet_path);
        sheet_path=append(excelSheetLocation,'R_resmat','.xlsx');
        writematrix(resMat_R,sheet_path);
    elseif i==2
        [m,n]=kmeans(resMat_G,4);
        sheet_path=append(excelSheetLocation,'G_m','.xlsx');
        writematrix(m,sheet_path);
        sheet_path=append(excelSheetLocation,'G_n','.xlsx');
        writematrix(n,sheet_path);
        sheet_path=append(excelSheetLocation,'G_resmat','.xlsx');
        writematrix(resMat_G,sheet_path);
    elseif i==3
        [m,n]=kmeans(resMat_B,4);
        sheet_path=append(excelSheetLocation,'B_m','.xlsx');
        writematrix(m,sheet_path);
        sheet_path=append(excelSheetLocation,'B_n','.xlsx');
        writematrix(n,sheet_path);
        sheet_path=append(excelSheetLocation,'B_resmat','.xlsx');
        writematrix(resMat_B,sheet_path);
    else
        [m,n]=kmeans(resMat_RGB,4);
        sheet_path=append(excelSheetLocation,'RGB_m','.xlsx');
        writematrix(m,sheet_path);
        sheet_path=append(excelSheetLocation,'RGB_n','.xlsx');
        writematrix(n,sheet_path);
        sheet_path=append(excelSheetLocation,'RGB_resmat','.xlsx');
        writematrix(resMat_RGB,sheet_path);
    end
end