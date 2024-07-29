function dmrs=generatePbchDmRs(issb_,NCellId)
    % generates PBCH DM-RS according SSB index and BS ID
arguments
    issb_ % issb+is_second_hf*4
    NCellId
end
    cinit=2^11*(issb_+1)*(floor(NCellId/4)+1)+2^6*(issb_+1)+mod(NCellId,4);
    w2=int2bit(cinit,31,false).';
    w1=[1,zeros(1,30)];
    for i=32:1600
        nw1=mod(w1(1)+w1(4),2);
        nw2=mod(w2(4)+w2(3)+w2(2)+w2(1),2);
        w1=circshift(w1,-1);
        w1(end)=nw1;
        w2=circshift(w2,-1);
        w2(end)=nw2;
    end
    c=zeros(1,288);
    for i=1:288
        nw1=mod(w1(1)+w1(4),2);
        nw2=mod(w2(4)+w2(3)+w2(2)+w2(1),2);
        w1=circshift(w1,-1);
        w1(end)=nw1;
        w2=circshift(w2,-1);
        w2(end)=nw2;
        c(i)=mod(nw1+nw2,2);
    end
    dmrs=1/sqrt(2)*(1-2*c(1:2:end))+1j/sqrt(2)*(1-2*c(2:2:end));
end


