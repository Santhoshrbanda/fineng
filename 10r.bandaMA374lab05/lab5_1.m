% Lab 5
% Markovitz Efficient Frontier

% All three

m = [0.1, 0.2, 0.15];
u = [1, 1, 1];
C = [0.005, -0.010, 0.004; -0.010, 0.040, -0.002; 0.004, -0.002, 0.023];


for i=1:3000
    
    ret = i*0.0001 ;
    y = [ret ; 1];
    M = [m*(C\m') , u*(C\m') ; m*(C\u'), u*(C\u')];
    lam = 2*(M\y);
    w = ( lam(1,1)*m*inv(C) + lam(2,1)*u*inv(C) )/2 ;
    sig = sqrt(w*C*w');
    
     plot(sig,ret,'-g')
     hold all ;
     
     if(min(w)>0)
        
        plot(sig,ret,'-r')
        
        %plot3(w(1,1) , w(1,2), w(1,3),'b+') 
        hold all;
        
     end
end

grid on ;

xlabel('risk')
ylabel('return')
title('risk vs return plot ')


w1 = rand(1,100000);
w2 = rand(1,100000);

w3=1-w1-w2;

for i = 1:length(w1)
    
    w = [w1(i) w2(i) w3(i)];
    
    if (w1(i)>=0) && (w2(i) >=0) && (w3(i) >=0)
        mean = w*m' ;
        sd = sqrt (w*C*w') ;
        plot(sd,mean,'-r')
        hold all ;
    end
    
end 
 

% Stock 1 & 2

m1 = [0.1, 0.2];
u1 = [1, 1];
C1 = [0.005, -0.010 ; -0.010, 0.040];
 

for i=1:3000
    
    ret1 = i*0.0001;
    y1 = [ret1 ; 1];
    M1 = [m1*inv(C1)*m1' , u1*inv(C1)*m1' ; m1*inv(C1)*u1', u1*inv(C1)*u1'];
    lam1 = 2*inv(M1)*y1;
    w1 = ( lam1(1,1)*m1*inv(C1) + lam1(2,1)*u1*inv(C1) )/2;
    sig1 = sqrt(w1*C1*w1');
    
    %if(min(w1)>0)
        plot(sig1,ret1,'-b');
        %plot3(w1(1,1) , w1(1,2), 0,'*r')
        hold all;
    %end

end

% Stock 2 & 3

m2 = [0.2, 0.15];
u2 = [1, 1];
C2 = [0.040, -0.002; -0.002, 0.023];
 


for i=1:3000
    
    ret2 =  i*0.0001;
    y2 = [ret2 ; 1];
    M2 = [m2*inv(C2)*m2' , u2*inv(C2)*m2' ; m2*inv(C2)*u2', u2*inv(C2)*u2'];
    lam2 = 2*inv(M2)*y2;
    w2 = ( lam2(1,1)*m2*inv(C2) + lam2(2,1)*u2*inv(C2) )/2;
    sig2 = sqrt(w2*C2*w2');
    
    %if(min(w2)>0)
        plot(sig2,ret2,'-k')
        %plot3(0 , w2(1,1), w2(1,2),'+c')
        hold all;
    %end/home/mathsuser

end

%Stock 1 & 3

m3 = [0.1, 0.15];
u3 = [1, 1];
C3 = [0.005, 0.004; 0.004, 0.023];
 


for i=1:3000
    
    ret3 = i*0.0001;
    y3 = [ret3 ; 1];
    M3 = [m3*inv(C3)*m3' , u3*inv(C3)*m3' ; m3*inv(C3)*u3', u3*inv(C3)*u3'];
    lam3 = 2*inv(M3)*y3;
    w3 = ( lam3(1,1)*m3*inv(C3) + lam3(2,1)*u3*inv(C3) )/2;
    sig3 = sqrt(w3*C3*w3');
    
    %if(min(w3)>0)
        plot(sig3,ret3,'-y')
        %plot3(w3(1,1), 0 , w3(1,2),'g+');
        hold all;
    %end
    
    
end

% figure ;
% 
% 
% % last part of first question
% 
% mu=[0:0.001:0.2];
% 
% for k=1:length(mu)
%     
%     y = [mu(k) ; 1];
%     M = [m*(C\m') , u*(C\m') ; m*(C\u'), u*(C\u')];
%     lam = 2*(M\y);
%     w = ( lam(1,1)*m*inv(C) + lam(2,1)*u*inv(C) )/2 ;
%     sig = sqrt(w*C*w');
%     
%     w1(k)=w(1);   w2(k)=w(2);
%    
%     
% end
% 
% 
% plot(w1,w2,'r');
% xlabel('w1')
% ylabel('w2')
% title('w1 vs w2')
% 
% grid on;
% hold on;
% 
% x=[0:0.1:1];
% xz=zeros(1,length(x));
% plot(xz,x);
% hold on;
% 
% plot(x,xz);
% hold on;
% 
% y=[1:-0.1:0];
% plot(x,y);
% 
% hold off ;
% 
