clear all

for i=1:45
    cel = imread(strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\mass\cel_', int2str(i),'.jpg'));   
    nuc = imread(strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_nucleos\gen_nuclei_cel_', int2str(i),'.jpg'));
    nuc = im2bw(nuc);
    
    [l n] = bwlabel(nuc);
    s = regionprops(l, 'Centroid');
    
    nuc = im2double(nuc);
    cel = im2double(cel);
    for x=1:512
        for y=1:512
            if(cel(x, y) == 1)
                coor=s(1,1).Centroid;
                dist = sqrt(power(y-coor(1,1), 2) + power(x-coor(1,2), 2));
                cel(x,y) = 10/255.0;
                for k=2:n
                    coor = s(k, 1).Centroid;
                    if(sqrt(power(y-coor(1,1), 2) + power(x-coor(1,2), 2))<dist)
                        dist = sqrt(power(y-coor(1,1), 2) + power(x-coor(1,2), 2));
                        cel(x, y) = k*10/255.0;
                    end
                end
            end
        end
    end
    
    for u=1:n
        im = zeros(512);
        for x=1:512
            for y=1:512
                if(cel(x, y)== u*10/255.0)
                    im(x, y) = 1;
                end
            end
        end
        
        im = imdilate(im, se);
        imwrite(im, strcat('C:\Users\Marilene\Desktop\pdi_finaltrab\gen_cyto\cel_', int2str(i), '\cyto_', int2str(u),'.jpg'), 'JPEG');
    end
end