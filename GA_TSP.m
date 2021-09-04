%% 智能算法第四例遗传算法+TSP
%%清屏
clear
clc
close all
tic
%% 初始化
Adjacency_matrix=Get_Adjacency(1,'power.xlsx');
NIND=80;                                        %种群规模
MAXGEN=200;                                     %迭代次数
px=0.7;                                         %交叉概率
pm=0.01;                                        %变异概率
gen=1;
Fitmean=[];
Y=[];
[PM,PN]=size(Adjacency_matrix);
%% 模型建立
%生成初始种群
Chrom=TSP_population(NIND,PN);
Chrom=Limit_population(Chrom);
[N,L]=size(Chrom);
%显示参数
fprintf('Number of generations:%d\n',MAXGEN);
fprintf('Population size:%d\n',N);
fprintf('Crossover probability:%.3f\n',px);
fprintf('Mutation probability:%.3f\n',pm);
%计算适应度，画图
FitnV=Fit_fun_TSP(Chrom,Adjacency_matrix);
figure(1);
grid on;
hold on;
plot(FitnV,'k*');
%% 进化
while gen<=MAXGEN
    %Reproduction(Bi-classist Selection)
    Fitmax=max(FitnV);
    FitnV=Fitmax-FitnV;
    SelCh=Roulette_selection(Chrom,FitnV);              %轮盘选择
    SelCh=Single_point_crossover(SelCh,px);         	%单点交叉运算
    SelCh=Bit_mutation(SelCh,pm);                       %基本位变异运算
    Chrom=Limit_population(SelCh);                      %总群硬性限制（可更改）
    
    FitnV=Fit_fun_TSP(Chrom,Adjacency_matrix);
    %保留中间运算结果    
    [sol,indb]=min(FitnV);
    Chrom(1,:)=Chrom(indb,:);
    media=mean(FitnV);
    Y=[Y sol];                                          %每代最优
    Fitmean=[Fitmean media];                            %每代平均路径值
    gen=gen+1;
end
%% 显示结果
fprintf('\nShortroad is %s\n',num2str(find(Chrom(indb,:))));
fprintf('Mutation is:%d',sol);
Chrom(indb,:)
%最优结果
figure(1);
plot(FitnV,'r^');
title('种群的初始和最终位置','fontsize',16);
legend({'初始位置','最终位置'},'FontSize',11,'Location','Northeast');
xlabel('种群个体','fontsize',14);
ylabel('路径值','fontsize',14);
%数据变化
figure(2);
plot(Y);
title('最优及平均路径值变化趋势','fontsize',16);
xlabel('迭代次数','fontsize',14);
ylabel('路径值','fontsize',14);
hold on;
plot(Fitmean,'r');
legend({'最优值','平均值'},'FontSize',11,'Location','Northeast');
hold off;
