function Md=F_Md(d,Rd)
global R_d;
global M_d;
% resolve Mb for a Rd value
% R_d and M_d are vectors for resource demand and total price
Md = interp1(R_d,M_d(d,:),Rd,'linear');
end