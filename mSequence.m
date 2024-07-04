function x = mSequence(m,start_arr,coefs)
% Generates M-sequence with (2^m-1) elements  
%   m           - order of the shift element
%   start_arr   - initial values for first `m` elements
%   coefs       - coefficients for values in shift array must
%                 be a string vector with length `m`+ 1
%   E.g.:   m=7,start_arr=[1,0,0,0,0,0,0],
%           coefs =[1,1,0,0,0,1,0,0]
%                   ^ ^       ^
%           M[i+7]=(1+1*M[i]+1*M[i+4]) mod 2
    x=zeros(1,2^m-1);   % allocating memory
    x(1:m)=start_arr;   % initializing values
    for i=1:1:2^m-1-m   % comments are unnecessary
        x(i+m)=mod(x(i:i+m-1)*(coefs(2:m+1).'),2); % Matrix magic (algebra)
    end
end