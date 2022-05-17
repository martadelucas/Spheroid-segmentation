clear;
myFolder =  uigetdir();                                                     % choose directory with image files
searchpattern = '*.tif';    

fileNames = fullfile(myFolder,searchpattern);
images = dir(fileNames)
coll_table= table (0,0,0,0,0,'VariableNames',{'Droplet ID', 'Area', 'Perimeter', 'Circularity', 'Dist2Center'});
coll_table2 = table(0,0,0,0,0,0,'VariableNames', {'Droplet ID', 'Area', 'Perimeter', 'Circularity', 'Centroid x', 'Centroid y'});
names = {images(:).name};
fullImageAddress = strcat(myFolder,"/",names);
newstruct = 'Droplet ID';
fullImageAddress = convertStringsToChars(fullImageAddress);

for i = 1:length(fullImageAddress)
    a = char(fullImageAddress(i));
    if isfile(a)   
        BW = imread(a);
        [cx,cy] = size(BW) ;
        Binary = im2bw(BW,0.4); 
        props = regionprops(Binary, 'Area', 'Perimeter','Circularity', 'Centroid');
        t = struct2table(props);
        doplet_name = erase(a, (fileparts(a)));
        doplet_name = erase(doplet_name, "/");
       
%   This is to add rows for the names when more than one object is detected
%   in the image  
        b = height(t);
        repeated = repmat({[doplet_name]}, b,1);
        [t.(newstruct)] = repeated;
        sorted_t = table(t.("Droplet ID"), t.Area, t.Perimeter, t.Circularity, t.Centroid(:,1), t.Centroid(:,2), 'VariableNames', {'Droplet ID', 'Area', 'Perimeter', 'Circularity', 'Centroid x', 'Centroid y'});
% % % this is to select only the object with the biggest area
        [M,I] = max(t.Area);
        keeper = t(I,:);
        CX = cx/2;
        CY = cy/2;
        X = [CX,CY;keeper.Centroid];
        distance = pdist(X,'euclidean');
        add_rows = table(keeper.("Droplet ID"), keeper.Area, keeper.Perimeter, keeper.Circularity, distance,'VariableNames',{'Droplet ID', 'Area', 'Perimeter', 'Circularity', 'Dist2Center'} );
% % %  IMPORTANT: LINES BELOW UPDATE THE TABLE ADDING ROWS. IT IS YOUR CHOICE TO 
% % %  EITHER 
% % % Biggest region including the ditance to center calculations 
coll_table = [coll_table ; add_rows];
direct = strcat(myFolder, "/RT4_all_masks_distances.csv");
writetable(coll_table, direct);
% % % OR 
% % % All the detected objects with the coordinates for the centroid of the
% object.
coll_table2 = [coll_table2 ; sorted_t];
direct = strcat(myFolder, "/RT4_all_mask_regions.csv");
writetable(coll_table2, direct);
     end
end