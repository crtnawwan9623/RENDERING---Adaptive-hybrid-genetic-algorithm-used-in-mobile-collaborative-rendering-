clear UpdateDistance;
Gen=1;
ITER=10;
GGAP=0.8;
Dist=0.5;
Dist_log=Dist;
Pop=Pop_back;
FitValue_opt_log=max(ObjFun(Pop));
while Gen<15   %default=20
    Gen=Gen+1;
    display(Gen);
    FitValue=ObjFun(Pop);
    Pop1=TournamenentSel(Pop,FitValue,GGAP);
    while isempty(Pop1) == false
        i=randi(length(Pop1));
        X_i=Pop1{i};
        j=SelMateTarget(Pop1,i,Dist,1);
        X_j=Pop1{j};
        [X_i,X_j]=Crossover(X_i,X_j);
        X_i=Mutate(X_i);
        X_j=Mutate(X_j);
        X_i=Locsearch(X_i);
        X_j=Locsearch(X_j);
        Pop1([i,j])=[];
        Pop=[Pop,{X_i},{X_j}];
    end
    Pop=Reselect(Pop,Num);
    X_opt=argmax(Pop);
    FitValue_opt_log=[FitValue_opt_log,ObjFun({X_opt})];
    Dist=UpdateDistance(Dist,X_opt);
    Dist_log=[Dist_log,Dist];
end
FitValue_opt_fnl_AHGA=FitValue_opt_log(length(FitValue_opt_log));
display('AHGA is over');

%Greedy
XX=Pop_back{randi(Num)};
Greedy;
FitValue_opt_fnl_G=FitValue_opt_log_G(length(FitValue_opt_log_G));
display('Greedy is over');

%Random
FitValue_opt_fnl_R=max(ObjFun(Pop_back));