function Adjacency_matrix = Get_Adjacency(mode,s)
%%输入mode=1时需要输入xlsx的地址
%%输入mode=0时输入节点距离生成邻接矩阵
    if nargin==1
        if  mode==0
            disp('输入参数');
            [Adjacency_matrix,~]=TSP_myAdjacency();
        else
            err('参数错误');
        end
    elseif nargin==2
        if mode==1
            Adjacency_matrix=xlsread(s);
        else
            err('参数错误');    
        end
    end
end