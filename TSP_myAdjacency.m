function  [Adjacency_matrix,Adjacency_list]= TSP_myAdjacency()
     flag=input('请输入是否为无向图:y/n:','s');
     if flag~='y'&&flag~='n'
         error('输入错误');
     end
     
     node=input('请输入节点数:');
     if length(node)~=1
         error('请重新输入');
     end
     m=node(1);%n=psize(2);
     if flag=='y'
         Adjacency_matrix=zeros(m,m);
         for i=1:m
             for j=i+1:m
             	distance=input(['请输入第',num2str(i),'个节点与第',num2str(j),'个节点的距离:']);
             	Adjacency_matrix(i,j)=distance;
             end
         end
         Adjacency_matrix=Adjacency_matrix+Adjacency_matrix';
         Adjacency_list= graph(Adjacency_matrix,'upper','OmitSelfLoops');
     else
         Max_distance=input('请设定最大距离值，超过该值认为两个节点之间断路:');
         Adjacency_matrix=Max_distance*ones(m,m);
         for i=1:m
             for j=1:m
                 if j~=i
                 	if Adjacency_matrix(j,i)>=Max_distance
                        distance=input(['请输入第',num2str(i),'个节点与第',num2str(j),'个节点的距离:']);
                        Adjacency_matrix(i,j)=distance;
                 	end
                 else
                     Adjacency_matrix(i,j)=0;
                 end
             end
         end
         Adjacency_list= digraph(Adjacency_matrix,'omitselfloops');
     end
end

