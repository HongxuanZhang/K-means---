function kmeans(k,data);
% k,�������ĸ���
% data, ���ݼ�
% data = data';
[sample_size,feature_size] = size(data);

% ���ѡȡk����������
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