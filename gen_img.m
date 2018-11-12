for i=1:45
    data = train_Cytoplasm(i,1);
    data = data{:,:};
    for j=1:size(data, 1)
        im = data{j,1};
        mkdir(strcat('cel_', int2str(i)));
        imwrite(im, strcat('cel_', int2str(i),'\cytoplasm_',int2str(j),'.jpg'));
    end
end