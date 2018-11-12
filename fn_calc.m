clear;
fn = 0;
for i=1:45
    o_path_cito = strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\nucleos\cel_',int2str(i),'_nuclei.jpg');
    f_path_cito = strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_nucleos\gen_nuclei_cel_',int2str(i),'.jpg');
    
    o_cito = im2double(imread(o_path_cito));
    f_cito = rgb2gray(im2double((imread(f_path_cito))));
    
    for x=1:512
        for y=1:512
            if((o_cito(x, y) == 1) && (f_cito(x,y)==0))
                fn = fn+1;
            end
        end
    end
  
end

fn = fn/(45*512*512);
