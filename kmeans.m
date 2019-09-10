function kmeans(k,data)
% k,�������ĸ���
% data, ���ݼ�,��ر�֤��һ��Ϊһ������
% data = data';
[sample_size,feature_size] = size(data);

% ���ѡȡk����������
First_id = randperm(sample_size,k);
cluster_center = data(First_id,:);

cluster_center_new = zeros(size(cluster_center));
first = 1;
while ~all(cluster_center_new == cluster_center) 
    if ~first
        cluster_center = cluster_center_new;
    else
        first = 0;
    end
    cluster_index = zeros(k,sample_size); % ÿһ�д���ĳ�����������е���������ֵ
    
    cluster_num = ones(k,1);             % ��ʾcluster_index����洢������(�Ѵ��)
    
    for i = 1:sample_size
%         if any(i == cluster_center)
%             continue;
%         end
        Euclidean_distance = pdist2(data(i,:),cluster_center,'euclidean'); %����ŷʽ����
        min_dist_index = (Euclidean_distance==min(Euclidean_distance));
        % Ϊ��ֹ�ж����Сֵ��ѡȡ��һ����Ϊ��������ľ�������
        I1= find(min_dist_index,1,'first');
        cluster_index(I1,cluster_num(I1)) = i;
        cluster_num(I1) = cluster_num(I1)+1;
    end
    
    % �����Ѿ��õ���ÿ��������ģʽ�࣬������Щģʽ�࣬�����µľ�������
    cluster_center_new = FindNewCenter(cluster_index,cluster_num,data);
    
end
cluster_center_new