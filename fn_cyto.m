clear;
fn = 0;
for i=1:45
    local_fn = 0 ;
    
    mdir = strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\cytoplasm\cel_', int2str(i));
    mdir = (dir(mdir));
    number_images = size(mdir,1) - 2;
    
    mdir2 = strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_cyto\cel_', int2str(i));
    mdir2 = (dir(mdir2));
    number_images2 = size(mdir2,1) - 2;
    
    for j=1:number_images
        if(exist(strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_cyto\cel_', int2str(i), '\cyto_', int2str(j), '.jpg'), 'file') == 2)
            oi = imread(strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\cytoplasm\cel_', int2str(i), '\cytoplasm_', int2str(j), '.jpg'));
            ti = imread(strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_cyto\cel_', int2str(i), '\cyto_', int2str(j), '.jpg'));
            oi = im2double(oi);
            ti = im2double(ti);
            im_fn = 0;
            for x=1:512
                for y=1:512
                    if((oi(x,y) == 1) && (ti(x,y) == 0))
                        im_fn = im_fn+1;
                    end
                end
            end
            im_fn = im_fn/(512*512);
            local_fn= local_fn+im_fn;
        else
            local_fn = local_fn+1;
        end
    end
    fn = fn+(local_fn/number_images2);
end

fn = fn/45;
