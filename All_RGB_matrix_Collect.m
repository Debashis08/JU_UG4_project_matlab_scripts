topLevelFolder = 'D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE';      
files = dir(topLevelFolder);
dirFlags = [files.isdir];
subFolders = files(dirFlags);
subFolderNames = {subFolders(3:end).name};
for k = 1 : length(subFolderNames)
	fprintf('Sub folder #%d = %s\n', k, subFolderNames{k});
    str=append("D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE\",subFolderNames{k});
    fprintf('%s',str);
    fprintf('\n');
    str_mat(:,k)=str;
end
str_mat(5)=[];
str_temp=str_mat(:,2);
str_mat(2)=[];
str_mat=[str_mat,str_temp];
resMat=[];
for i=1:4
    folderName=str_mat(:,i);
    str=append(folderName,"\");
    fprintf('%s',str);
    fprintf('\n');
    
    temp_path=append(str,"R_resmat");
    resMat_R=xlsread(temp_path);
    
    temp_path=append(str,"G_resmat");
    resMat_G=xlsread(temp_path);
    
    temp_path=append(str,"B_resmat");
    resMat_B=xlsread(temp_path);
    
    temp_path=append(str,"RGB_resmat");
    resMat_RGB=xlsread(temp_path);
    
    resMat=[resMat,resMat_R,resMat_G,resMat_B,resMat_RGB];
end
excel_path="D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_resmat.xlsx";
writematrix(resMat,excel_path);
[m,n]=kmeans(resMat,4);
excel_path="D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_m.xlsx";
writematrix(m,excel_path);
excel_path="D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_n.xlsx";
writematrix(n,excel_path);