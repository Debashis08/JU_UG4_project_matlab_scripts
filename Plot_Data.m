cur_degree="0";     %%<----change this to 0,45,90,135 subseqeuntly
folderName=append("D:\4TH YEAR\1ST SEMESTER\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE_RGB\",cur_degree,"_Degree_GLCM\");
cur_channel="B";    %%<----change this for each degree,... R,G,B,RGB

str=append(folderName,cur_channel,"_m.xlsx");
m=xlsread(str);

str=append(folderName,cur_channel,"_n.xlsx");
n=xlsread(str);

str=append(folderName,cur_channel,"_resmat.xlsx");
resMat=xlsread(str);

color=["red","blue","black","green"];
for k=1:4
    scatter(n(k,1),n(k,2),color{k});
    hold on;
 end
for k=1:4
    scatter(resMat(m==k,1),resMat(m==k,2),8,color{k});
    hold on;
end
set(gcf, 'Position', get(0, 'Screensize'));
location="D:\4TH YEAR\1ST SEMESTER\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE_RGB\";%%<----change the path where the plots will be saved
str=append(location,cur_degree,"_Degree_GLCM_",cur_channel);
saveas(gcf,str,"jpg");
fprintf("Done");
fprintf('\n');