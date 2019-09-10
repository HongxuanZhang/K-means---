function [cluster_center_new] = FindNewCenter(cluster_index,cluster_num,data);
[m,~] = size(cluster_index);
[~,n] = size(data);
cluster_center_new =  zeros(m,n);
for i = 1:m
    data_i = data(cluster_index(i,1:cluster_num(i)-1),:);
    cluster_center_new(i,:) = mean(data_i,1);
end