clear all;
close all;
clc;

%var:
POPSIZE=100;
CHindex=0;
F=1;



Chileds=zeros(POPSIZE,8);
Parents=zeros(POPSIZE,8);

X=zeros(2*POPSIZE,8);

FittnessT=zeros(200,1);
MaxFittness=1000;


%Ehtemalat:
cross=1.0;
mutation=0.7;




% Cross Over:

for i=1:POPSIZE
   Parents(i,:)=randperm(8); 
end


while(F>=1)
    
    for i=1:POPSIZE/2
       indexp=ParentSelection(POPSIZE);
       ParentA=Parents(indexp(1),:);
       ParentB=Parents(indexp(2),:);
       
       if(rand<=cross)

             [ChildA,ChildB]=CrossOverC(ParentA,ParentB);
       else
           ChildA=ParentA;
           ChildB=ParentB;
       end
       
       
       
       
% Mutation:

  for j=1:8
      if(rand<=mutation)
         ChildA=Mutation(ChildA);
         ChildB=Mutation(ChildB);
      end
  end
       
       CHindex=CHindex+1;
       Chileds(CHindex,:)=ChildA;
       CHindex=CHindex+1;
       Chileds(CHindex,:)=ChildB;
       
    end
    
    
    
    
    
    
% Fitness:
    
    CHindex=0;
    X(1:POPSIZE,:)=Parents;
    X(POPSIZE+1:200,:)=Chileds;
    
    for i=1:2*POPSIZE
        FittnessT(i)=Fitness(X(i,:)); 
    end
    
    [V,Ind]=sort(FittnessT);
    Parents=X(Ind(POPSIZE+1:end),:);
    BestR=Parents(end,:);
    
    
    
    %Avg:
    F_size(F,:)=V(POPSIZE+1:end,1);
    Fittness_AVG = mean(F_size,2)
    
    
    
    Fitness_Best(F,1)=V(end,1);
    
   
    
    if(Fitness(BestR)==MaxFittness)
       break;
%        BestR
    end
    
    F=F+1;
end




figure (1)

plot(Fitness_Best);
title('BestFittnes');
grid on

figure (2)

plot(Fittness_AVG);
title('AverageFittnes');
grid on

