cur_degree="135";     %%<----change this to 0,45,90,135 subseqeuntly
folderName=append("D:\4TH YEAR\Project_1\Sumana_temp_files\GLCM\",cur_degree,"_degree GLCM\");
cur_channel="RGB";    %%<----change this for each degree,... R,G,B,RGB

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
location="D:\4TH YEAR\Project_1\Sumana_temp_files\GLCM\";%%<----change the path where the plots will be saved
str=append(location,cur_degree,"_degree GLCM_",cur_channel);
saveas(gcf,str,"jpg");
fprintf("Done");
fprintf('\n');