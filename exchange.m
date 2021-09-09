function X_out=exchange(X_in,d1,d2)
%exchange the allocatioin of device d1 and d2 (two columns in X matrix)
global Etotal_tol;
global trdtrip_tol;
X_out=X_in;
X_out(:,[d1,d2])=X_out(:,[d2,d1]);
if Etotal(X_out)<=Etotal_tol && t_rd_trip(X_out)<=trdtrip_tol
    return;
else
    X_out=X_in;
end

end