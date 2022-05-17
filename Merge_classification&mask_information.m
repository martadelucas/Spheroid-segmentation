clear;
myFolder =  uigetdir();
classification = strcat(myFolder,"/",'All_RT4_classif');
masks = strcat(myFolder,"/",'RT4_all_masks_distances.csv');
table_classif = readtable(classification);
%this lines are to format the tables so they can be merged. 
table_masks = readtable(masks);
table_masks(1,:) = [];
new_names = strrep(table_masks.DropletID,'.tif','.jpg');
table_masks(:,1) = new_names
table_classif(:,1) = [];
table_classif.Properties.VariableNames = {'DropletID','Prediction','Probability'};
table_classif([1,2,3],:) = [];
% 
mergedTable = join(table_classif,table_masks);
%writetable(mergedTable,'MergedTables_one_object.csv');

merged = readtable('MergedTables_one_object.csv',"TextType","string");
dimensions =size(merged);

%to calculate the metrics for the diff parameters
% metrics_Area = groupsummary(merged,"Prediction","all","Area")
% metrics_circularity = groupsummary(merged,"Prediction","all","Circularity")
% metrics_perimeter = groupsummary(merged,"Prediction","all","Perimeter")
% metrics_dist = groupsummary(merged,"Prediction","all","Dist2Center")
% %let's join the tables and make the predictions the column
% all_metrics = join((join(metrics_Area,metrics_circularity)), metrics_dist);
% reshaped_metrics = rows2vars(all_metrics,'VariableNamesSource','Prediction');
% %finallt, write all the metrics into a file 
% writetable(reshaped_metrics,'RT4_statistics.csv');

