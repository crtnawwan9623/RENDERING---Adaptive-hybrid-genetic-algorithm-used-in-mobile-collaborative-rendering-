function Ercv=F_E_rcv(X,Prcv,ar_cur,Srstb,vrcvd)

[numb,numd]=size(X);
Ercv=0;
for i=1:numd
    for j=1:numb
        Ercv=Ercv+X(j,i)*Prcv*ar_cur*Srstb(j)/vrcvd(i);
    end
end

end
