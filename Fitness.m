function a=Fitness(x)
    x2=zeros(8,8);
    for i=1:8
       x2(x(i),i)=1; 
    end
    hits=0;
    for i=1:8
       for j=1:8
          if(x2(i,j)==1)
             c=j+1;
             r=i-1;
             for r=r:-1:1
                 if(c==9||r==0)
                     break;
                 end
                 if(x2(r,c)==1)
                     hits=hits+1;
                 end
                 if(c==8)
                     break;
                 else
                     c=c+1;
                 end
             end
             c=j+1;
             r=i+1;
             for r=r:8
                 if(c==9||r==9)
                     break;
                 end
                 if(x2(r,c)==1)
                     hits=hits+1;
                 end
                 if(c==8)
                     break;
                 else
                     c=c+1;
                 end
             end
             c=j-1;
             r=i-1;
             for r=r:-1:1
                 if(c==0||r==0)
                     break;
                 end
                 if(x2(r,c)==1)
                     hits=hits+1;
                 end
                 if(c==1)
                     break;
                 else
                     c=c-1;
                 end
             end
             c=j-1;
             r=i+1;
             for r=r:8
                 if(c==0||r==9)
                     break;
                 end
                 if(x2(r,c)==1)
                     hits=hits+1;
                 end
                 if(c==1)
                     break;
                 else
                     c=c-1;
                 end
             end
             c=j+1;
             r=i;
             for c=c:8
                 if(c==9)
                     break;
                 end
                 if(x2(r,c)==1)
                     hits=hits+1;
                 end
             end
             c=j;
             r=i-1;
             for r=r:-1:1
                 if(r==0)
                     break;
                 end
                 if(x2(r,c)==1)
                     hits=hits+1;
                 end
             end
             c=j-1;
             r=i;
             for c=c:-1:1
                 if(c==0)
                     break;
                 end
                 if(x2(r,c)==1)
                     hits=hits+1;
                 end
             end
             c=j;
             r=i+1;
             for r=r:8
                 if(r==9)
                     break;
                 end
                 if(x2(r,c)==1)
                     hits=hits+1;
                 end
             end
             x2(i,j)=0;
          end
       end
    end
    a=1000/(hits+1);
end