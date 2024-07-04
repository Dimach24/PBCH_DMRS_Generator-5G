function dmrs=generatePbchDmRs(issb_,NCellId)
arguments
    issb_ % issb+is_second_hf*4
    NCellId
end
    cinit=2^11*(issb_+1)*(floor(NCellId/4)+1)+2^6*(issb_+2)+mod(NCellId,4);
    initArr=int2bit(cinit,31,false).';

    x1=mSequence(31,[1,zeros(30)],[0,1,0,0,1,zeros(27)]);
    x2=mSequence(31,initArr,[0,1,1,1,1,zeros(27)]);
    
    x1=circshift(x1,1600);
    x2=circshift(x2,1600);

    c=xor(x1,x2);

    dmrs=1/sqrt(2)*(1-2*c(1:2:end)+1j-2j*c(2:2:end));
end


