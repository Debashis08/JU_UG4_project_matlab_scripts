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
        R=img(:,:,1);
        G=img(:,:,2);
        B=img(:,:,3);

        r=graycomatrix(R,'offset',[0 1]);
        g=graycomatrix(G,'offset',[0 1]);
        b=graycomatrix(B,'offset',[0 1]);
        
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
%     [m,n]=kmeans(resMat_G,4);
%     color=["red","blue","black","green"];
%     for i=1:4
%         scatter(n(i,1),n(i,2),color{i});
%         hold on;
%     end   
%     scatter(resMat_G(m==1,1),resMat_G(m==1,2),8,"red");
%     hold on;
%     scatter(resMat_G(m==2,1),resMat_G(m==2,2),8,"blue");
%     hold on;
%     scatter(resMat_G(m==3,1),resMat_G(m==3,2),8,"black");
%     hold on;
%     scatter(resMat_G(m==4,1),resMat_G(m==4,2),8,"green");
%     hold on;
% writematrix(resMat_R,'D:\4TH YEAR\Project_1\MATRICES_GENERATED\Test.xlsx');
%     
excelSheetLocation='D:\4TH YEAR\Project_1\MATRICES_GENERATED\';
for i=1:3
    if i==1
        [m,n]=kmeans(resMat_R,4);
        sheet_path=append(excelSheetLocation,'Test_',int2str(i),'.xlsx');
        writematrix(n,sheet_path);
    elseif i==2
        [m,n]=kmeans(resMat_G,4);
        sheet_path=append(excelSheetLocation,'Test_',int2str(i),'.xlsx');
        writematrix(n,sheet_path);
    else
        [m,n]=kmeans(resMat_B,4);
        sheet_path=append(excelSheetLocation,'Test_',int2str(i),'.xlsx');
        writematrix(n,sheet_path);
    end
end