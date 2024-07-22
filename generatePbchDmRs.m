function dmrs=generatePbchDmRs(issb_,NCellId)
    % generates PBCH DM-RS according SSB index and BS ID
arguments
    issb_ % issb+is_second_hf*4
    NCellId
end
    cinit=2^11*(issb_+1)*(floor(NCellId/4)+1)+2^6*(issb_+2)+mod(NCellId,4);
    initArr=int2bit(cinit,5,false).';

    x1=mSequence(5,[1,zeros(1,4)],[0,1,0,0,1,0]);
    x2=mSequence(5,initArr,[0,1,1,1,1,0]);
    
    x1=circshift(x1,1600);
    x2=circshift(x2,1600);

    c=xor(x1,x2);
    dmrs=zeros(1,81);
    for k=1:81
        dmrs(k)=1/sqrt(2)*(1-2*c(mod(2*k,31)+1)+1j-2j*c(mod(2*k+1,31)+1));
    end
end


