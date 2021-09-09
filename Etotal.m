function Etol=Etotal(X_in)
global P_send;
global S_model_b;
global v_send_d;
global P_rcv;
global S_rst_b;
global v_rcv_d;
global E_cpt;
global a_r;
global r_cur;
global E_dsp;
global N_frame;


% solve E_send
E_send=F_E_send(X_in,P_send,S_model_b,v_send_d);

% solve E_rcv
E_rcv=F_E_rcv(X_in,P_rcv,a_r(r_cur),S_rst_b,v_rcv_d);

% E_cpt and E_dsp is set in init.m, becaue it is independent on X

Etol=E_send+N_frame*(E_rcv+E_cpt(r_cur)+E_dsp);
end