function SelCh = Bit_mutation(Chrom,pm)
    [N,L]=size(Chrom);
    M=rand(N,L)<=pm;
    SelCh=Chrom-2.*(Chrom.*M)+M;
end

