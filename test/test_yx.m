clc
clear
Adjacency_matrix=Get_Adjacency(0);              %得到邻接矩阵  取0手动输入参数，取1则需要输入xlax表的地址
disp(Adjacency_matrix);
xlswrite('示例2.xlsx',Adjacency_matrix);