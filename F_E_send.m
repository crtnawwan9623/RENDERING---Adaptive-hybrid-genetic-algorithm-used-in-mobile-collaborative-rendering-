function Esend=F_E_send(X,Psend,Smodelb,vsendd)

[numb,numd]=size(X);
Esend=0;
for i=1:numd
    for j=1:numb
        Esend=Esend+X(j,i)*Psend*Smodelb(j)/vsendd(i);
    end
end

end
