function kmeans(k,data)
% k,聚类中心个数
% data, 数据集,务必保证以一行为一个样本
% data = data';
[sample_size,feature_size] = size(data);

% 随机选取k个聚类中心
First_id = randperm(sample_size,k);
cluster_center = data(First_id,:);

cluster_center_new = zeros(size(cluster_center));
first = 1;

cluster_index = [];
cluster_num = [];

while ~all(cluster_center_new == cluster_center) 
    if ~first
        cluster_center = cluster_center_new;
    else
        first = 0;
    end
    
    cluster_index = zeros(k,sample_size); % 每一行代表某个聚类中所有的数据索引
    cluster_num = ones(k,1);             % 表示cluster_index矩阵存储到哪了(已存的)
    
    for i = 1:sample_size
        Euclidean_distance = pdist2(data(i,:),cluster_center,'euclidean'); %计算欧式距离
        min_dist_index = (Euclidean_distance==min(Euclidean_distance));
        % 为防止有多个最小值，选取第一个作为距离最近的聚类中心
        I1= find(min_dist_index,1,'first');
        cluster_index(I1,cluster_num(I1)) = i;
        cluster_num(I1) = cluster_num(I1)+1;
    end
    % 现在已经得到了每个样本的模式类，根据这些模式类，计算新的聚类中心
    cluster_center_new = FindNewCenter(cluster_index,cluster_num,data);
end

for i2 = 1:k
    fprintf('\n第%d个聚类中心为',i2);
    disp(cluster_center_new(i2,:))
    fprintf('包含样本有\n');
    for j1 = 1:cluster_num(i2)-1
        fprintf('%d ',cluster_index(i2,j1));
    end
    fprintf('\n');
end
