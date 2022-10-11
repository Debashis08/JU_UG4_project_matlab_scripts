    location='D:\4TH YEAR\Project_1\CROPPED_ALL_IMAGES\BLACK\DUTA\PURE\*.jpg';
    imageds=imageDatastore(location);
    fullFileName=vertcat(imageds.Files);
    k=1;
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
        
        resMat_R(k,:)=r_val;
        resMat_G(k,:)=g_val;
        resMat_B(k,:)=b_val;
        k=k+1;
    end
    [m,n]=kmeans(resMat_R,4);
    for i=1:4
        scatter(n(i,1),n(i,2));
        hold on;
    end
    