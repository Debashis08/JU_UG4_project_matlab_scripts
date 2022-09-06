
location='D:\4TH YEAR\Project_1\CROPPED_ALL_IMAGES\BLACK\DUTA\PURE\*.jpg';
imageds=imageDatastore(location);
fullFileName=vertcat(imageds.Files);
k=1;
for i=1:5
    img=readimage(imageds,i);
%     figure;
%     imshow(img);
    R=img(:,:,1);
    G=img(:,:,2);
    B=img(:,:,3);
    r=graycomatrix(R);
    g=graycomatrix(G);
    b=graycomatrix(B);
    r=reshape(r,1,64);
    g=reshape(g,1,64);
    b=reshape(b,1,64);

    resMat_R(k,:)=r;
    resMat_G(k,:)=g;
    resMat_B(k,:)=b;
    k=k+1;
end