clear;
dice = 0;
for i=1:45
    o_path_cito = strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\nucleos\cel_',int2str(i),'_nuclei.jpg');
    f_path_cito = strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_nucleos\gen_nuclei_cel_',int2str(i),'.jpg');
    
    o_cito = im2double(imread(o_path_cito));
    f_cito = rgb2gray(im2double((imread(f_path_cito))));
    dice = dice+2*nnz(f_cito&o_cito)/(nnz(f_cito)+nnz(o_cito));
  
end

dice = dice/45;
