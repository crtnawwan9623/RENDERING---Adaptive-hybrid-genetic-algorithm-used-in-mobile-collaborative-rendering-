function [X_i_out,X_j_out]=Crossover(X_i_in,X_j_in)
global numb;
global Etotal_tol;
global trdtrip_tol;
i_cv=1;
while i_cv<=numb*2
loc=randi(numb-1);
X_i_out=[X_i_in(1:loc,:);X_j_in(1:numb-loc,:)];
X_j_out=[X_i_in(loc+1:numb,:);X_j_in(numb-loc+1:numb,:)];

if Etotal(X_i_out)<=Etotal_tol && t_rd_trip(X_i_out)<=trdtrip_tol && Etotal(X_j_out)<=Etotal_tol && t_rd_trip(X_j_out)<=trdtrip_tol
    return;
else
    X_i_out=X_i_in;
    X_j_out=X_j_in;
    i_cv=i_cv+1;
end
end


