m=xlsread("D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_m.xlsx");
n=xlsread("D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_n.xlsx");
resMat=xlsread("D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_resmat.xlsx");

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
location="D:\4TH YEAR\Project_1\MATRICES_WORKSPACES\BLACK_SUNRISE\";%%<----change the path where the plots will be saved
str=append(location,"All_Data_GLCM_Plot");
saveas(gcf,str,"jpg");
fprintf("Done");
fprintf('\n');
