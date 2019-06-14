 y=xlsread('./Altitude.xlsx');
 y=y(randperm(1000),:);
 y_test=y(901:1000,3);
 x_test=[ones(100,1) y(901:1000,1:2)];
 
 x_train=[ones(900,1) y(1:900,1:2)];
 y_train=y(1:900,3);
 alpha=0.001;
 theta=zeros(3,1);
 thetap=zeros(3,1);
 for i=1:100
     for j=1:900
         thetap=theta;
         a=x_train(j,:)*theta-y_train(j);
         delta=(a' *x_train(j,:))/900;
         theta=theta-alpha*delta';
     end
     msd=theta-thetap;
     msd=msd.^2;
     msd=sum(msd);
     msd=sqrt(msd);
     if msd < 0.01
         break;
     end
 end
 
 asd=x_test*theta-y_test;
 asd=sum(asd.^2);
 asd=sqrt(asd);
 
 %Code for batch gradient descent
 yb=xlsread('./Altitude.xlsx');
 y_testb=yb(901:1000,3);
 x_testb=[ones(100,1) yb(901:1000,1:2)];
 x_trainb=[ones(900,1) yb(1:900,1:2)];
 y_trainb=yb(1:900,3);
 alphab=0.001;
 thetab=zeros(3,1);
 for i=1:100
      a=x_trainb*thetab-y_trainb;
      deltab=(a' *x_trainb)/size(y_trainb,1);
      thetab=thetab-alphab*deltab';
 end
 asd1=x_testb*theta-y_testb;
 asd1=sum(asd1.^2);
 asd1=sqrt(asd1);
