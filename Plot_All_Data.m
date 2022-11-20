m=xlsread("D:\4TH YEAR\1ST SEMESTER\Project_1\MATRICES_WORKSPACES\MATRICES_WORKSPACES_NEW\BLACK_SUNRISE_RGB\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_m.xlsx");
n=xlsread("D:\4TH YEAR\1ST SEMESTER\Project_1\MATRICES_WORKSPACES\MATRICES_WORKSPACES_NEW\BLACK_SUNRISE_RGB\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_n.xlsx");
resMat=xlsread("D:\4TH YEAR\1ST SEMESTER\Project_1\MATRICES_WORKSPACES\MATRICES_WORKSPACES_NEW\BLACK_SUNRISE_RGB\GLCM_All_Data_0_45_90_135_Degree\All_Data_0_45_90_135_Degree_resmat.xlsx");

s=0;
temp_mat=[];
for i=1:4
    count_one=0;
    count_two=0;
    count_three=0;
    count_four=0;
    for j=s+1:s+100
        if(m(j,1)==1)
            count_one=count_one+1;
        end
        if(m(j,1)==2)
            count_two=count_two+1;
        end
        if(m(j,1)==3)
            count_three=count_three+1;
        end
        if(m(j,1)==4)
            count_four=count_four+1;
        end
    end
    temp_mat=vertcat(temp_mat,[count_one,count_two,count_three,count_four]);
    s=s+100;
end
cluster_no=[];

bool_vec=[0,0,0,0];
for i=1:4
    max_count=max(temp_mat(i,:));
    for j=1:4
        if(max_count==temp_mat(i,j))
            if(bool_vec(1,j)==0)
                cluster_no=horzcat(cluster_no,j);
                bool_vec(1,j)=j;
            else
                    for k=1:4
                        if(bool_vec(1,k)==0)
                            cluster_no=horzcat(cluster_no,k);
                            bool_vec(1,k)=k;
                            break;
                        end
                    end
            end
        end
    end
end


color=["","","",""];   
data=["","","",""];
for u=1:4
    if(u==1)
        color(1,cluster_no(1,u))="red";
        data(1,cluster_no(1,u))='Pure';
    end
    if(u==2)
        color(1,cluster_no(1,u))="blue";
        data(1,cluster_no(1,u))='1-1';
    end
    if(u==3)
        color(1,cluster_no(1,u))="green";
        data(1,cluster_no(1,u))='1-2';
    end
    if(u==4)
        color(1,cluster_no(1,u))="black";
        data(1,cluster_no(1,u))='1-4';
    end
    
end



for k=1:4
    scatter(n(k,1),n(k,2),70,color(1,k),"filled");
    hold on;
end

for i=1:4
    scatter(resMat(m==i,1),resMat(m==i,2),10,color(1,i),"filled");
    hold on;
end
legend(data);
set(gcf, 'Position', get(0, 'Screensize'));
location="D:\4TH YEAR\1ST SEMESTER\Project_1\MATRICES_WORKSPACES\MATRICES_WORKSPACES_NEW\BLACK_SUNRISE_RGB\";%%<----change the path where the plots will be saved
str=append(location,"All_Data_GLCM_Plot");
saveas(gcf,str,"jpg");
fprintf("Done");
fprintf('\n');
clear; %<---uncomment this line to see the variables or keep it as it is to clear the memory after every run