clc;
clear all;
T=1;
k=1.0;
J=1;
N=100;
S=rand(N);
for i=1:N
    for j=1:N
        if S(i,j)<=0.5;
            S(i,j)=-1;   
        else
            S(i,j)=1;
        end
    end
end

for sweep=1:1000
    E1=0;
    E2=0;
    for n=1:N
        for i=1:square(N)-1
            for j=i+1:square(N)
            E1 = E1 - J * S(i,j);
            end
        end
        
        a=randi(N);
        b=randi(N);
        S(a,b)=-S(a,b);
        for i=1:square(N)-1
            for j=i+1:square(N)
                E2 = E2 - J * S(i,j);
            end
        end
%Probability
        pacc = -exp((E2-E1)/(k*T));

    if ((E2-E1)>0)
        if (pacc>rand)
        else
            S(a,b)=-S(a,b);
        end
    end
    end
    pcolor(S);
    pause(0.01);
end    
    
