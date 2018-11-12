img = im2double(cel_45);
background = 1.0;%1
cytoplasm = 0.7;%2
nucleo = 0;%3
cyto_nuc = 0.3;%4
cluster = zeros(size(img,1), size(img,2));
for k=1:1
    for i=1:size(img,1)
        for j=1:size(img,2)
            dist = abs(img(i,j) - background);
            cluster(i,j) = 1;
            if(abs(img(i,j) - cytoplasm)<dist)
                dist = abs(img(i,j) - cytoplasm);
                cluster(i,j) = 2;
            end
            if(abs(img(i,j) - nucleo)<dist)
                dist = abs(img(i,j) - nucleo);
                cluster(i,j) = 3;
            end
            if(abs(img(i,j) - cyto_nuc)<dist)
                dist = abs(img(i,j) - cyto_nuc);
                cluster(i,j) = 4;
            end
        end
    end

    cytoplasm = 0;
    background = 0;
    nucleo = 0;
    cyto_nuc = 0;

    cytoplasm_count = 0;
    background_count = 0;
    nucleo_count = 0;
    cyto_nuc_count = 0;
    for i=1:size(img,1)
        for j=1:size(img,2)
            if(cluster(i,j) == 1)
                background = background+img(i,j);
                backgroung_count = background_count+1;
            end
            if(cluster(i,j) == 2)
                cytoplasm = cytoplasm+img(i,j);
                cytoplasm_count = cytoplasm_count+1;
            end
            if(cluster(i,j) == 3)
                nucleo = nucleo+img(i,j);
                nucleo_count = nucleo_count+1;
            end
            if(cluster(i,j) == 4)
                cyto_nuc = cyto_nuc+img(i,j);
                cyto_nuc_count = cyto_nuc_count+1;
            end
        end
    end

    cytoplasm = cytoplasm/cytoplasm_count;
    background = background/background_count;
    nucleo = nucleo/nucleo_count;
    cyto_nuc = cyto_nuc/cyto_nuc_count;
end

for i=1:size(img,1)
        for j=1:size(img,2)
            if(cluster(i,j) == 1)
                img(i,j) = 0;
            end
            if(cluster(i,j) == 2)
                img(i,j) = 0;
            end
            if(cluster(i,j) == 3)
                img(i,j) = 1.0;
            end
            
            if(cluster(i,j) == 4)
                img(i,j) = 0.75;
            end
        end
end


    