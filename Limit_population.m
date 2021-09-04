function Chrom=Limit_population(Chrom)
%%对种群个体进行限制
    Chrom(:,1)=1;
    Chrom(:,end)=1;
end