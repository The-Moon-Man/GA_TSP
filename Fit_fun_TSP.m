function F=Fit_fun_TSP(Chrom,Adjacency_matrix)%种群个体适应值，v为种群，Adjacency_matrix为系数矩阵(邻接矩阵)，
    [N,~]=size(Chrom);
    F=zeros(N,1);
    for i=1:N
        fp=find(Chrom(i,:)==1);
        [~,n]=size(fp);
        for j=1:n-1
            F(i)=F(i)+Adjacency_matrix(fp(j),fp(j+1));
        end
    end
end