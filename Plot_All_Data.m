m=xlsread("D:\4TH YEAR\Project_1\Sumana_temp_files\GLCM\0_45_90_135_degree GLCM\RGB_m.xlsx");
n=xlsread("D:\4TH YEAR\Project_1\Sumana_temp_files\GLCM\0_45_90_135_degree GLCM\RGB_n.xlsx");
resMat=xlsread("D:\4TH YEAR\Project_1\Sumana_temp_files\GLCM\0_45_90_135_degree GLCM\RGB_resMat.xlsx");

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
location="D:\4TH YEAR\Project_1\Sumana_temp_files\GLCM\";%%<----change the path where the plots will be saved
str=append(location,"All_Data_GLCM_Plot");
saveas(gcf,str,"jpg");
fprintf("Done");
fprintf('\n');
