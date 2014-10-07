clc;
clear all;
k=1;
J=1;
N=10;
S=rand(N);
for i=2:N+1
    for j=2:N+1
        if (rand <= 0.5)
            S(i,j)=-1;   
        else
            S(i,j)=1;
        end
    end
end
for i=[1,N+2]
    for j=1:N+2
        S(i,j)=0;
        S(j,i)=0;
    end 
end

for T=2:-0.05:0
    for sweep=1:1000
        for n=1:N*N
            a=randi([2,N+1]);
            b=randi([2,N+1]);
            
            delE = 2*S(a,b)*(S(a+1,b)+S(a-1,b)+S(a,b+1)+S(a,b-1));
%Probability
                pacc = exp(-delE /(k*T));

            if ((pacc >= rand))
                S(a,b)=-S(a,b);           
            end
        end
    end    
    
Sum=0;
    for i=2:N+1
        for j=2:N+1
            Sum=Sum+S(i,j);
        end
    end
    Sum
    if ((Sum==N*N) ||(Sum== -N*N))
        break;
    end
end
fprintf('The critical temperature is %d',T)