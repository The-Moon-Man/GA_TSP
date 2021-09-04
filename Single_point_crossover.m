function SelCh = Single_point_crossover(Chrom,pc)
    [N,L]=size(Chrom);
    C(:,1)=rand(N,1)<=pc;
    fc=find(C(:,1)==1);
    for i=1:2:size(fc)
        if i>=size(fc)
            break;
        end
        site=fix(1+L*rand(1));
        temp=Chrom(fc(i,1),:);
        Chrom(fc(i,1),site:end)=Chrom(fc(i+1,1),site:end);
        Chrom(fc(i+1,1),site:end)=temp(:,site:end);
    end
    SelCh=Chrom;
end

