function SelCh= Roulette_selection(Chrom,FitnV)%%轮盘选择
    [N,L]=size(Chrom);
    S=sum(FitnV);
    for i=1:N
        SI=S*rand(1);
        for j=1:N
            if SI<=sum(FitnV(1:j))
                SelCh(i,:)=Chrom(j,:);
                break;
            end
        end
    end
end

