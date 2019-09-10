function kmeans(k,data);
% k,聚类中心个数
% data, 数据集
% data = data';
[sample_size,feature_size] = size(data);

% 随机选取k个聚类中心
First_id = randperm(sample_size,k);
cluster_center = data(First_id,:);

cluster_center_new = zeros(size(cluster_center));

while all(cluster_center_new == cluster_center) 
    for i = 1:sample_size
%         if any(i == cluster_center)
%             continue;
%         end
        
    end
end