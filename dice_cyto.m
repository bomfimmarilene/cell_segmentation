clear;
dice = 0;
for i=1:45
    local_dice = 0 ;
    
    mdir = strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\cytoplasm\cel_', int2str(i));
    mdir = (dir(mdir));
    number_images = size(mdir,1) - 2;
    
    for j=1:number_images
        if(exist(strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_cyto\cel_', int2str(i), '\cyto_', int2str(j), '.jpg'), 'file') == 2)
            oi = imread(strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\cytoplasm\cel_', int2str(i), '\cytoplasm_', int2str(j), '.jpg'));
            ti = imread(strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_cyto\cel_', int2str(i), '\cyto_', int2str(j), '.jpg'));
            oi = im2double(oi);
            ti = im2double(ti);

            local_dice = local_dice+2*nnz(ti&oi)/(nnz(ti)+nnz(oi));
        else
            local_dice = local_dice+0;
        end
    end
    dice = dice+(local_dice/number_images);
end

dice = dice/45;
