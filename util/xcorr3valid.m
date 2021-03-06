function  c=xcorr3valid(im1,im2)
% XCORR3VALID(IM1,IM2) Three-dimensional cross-correlation
% The same as XCORR3
% IM2 is smaller than IM1. 
[m1 n1 p1]=size(im1); [m2 n2 p2]=size(im2);

c=zeros(m1-m2+1,n1-n2+1,p1-p2+1);
m = 1:m2;
for i=0:(m1-m2)
  n = 1:n2;
  for j=0:(n1-n2)
    p = 1:p2;
    for k=0:(p1-p2)
      c(i+1,j+1,k+1)=sum(reshape(im1(m,n,p),[],1).*im2(:));
      p = mod(p,p1)+1;
    end
    n = mod(n,n1)+1;
  end
  m = mod(m,m1)+1;
end
