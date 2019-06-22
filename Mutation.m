function A = Mutation(B)
    r=randi(8,1,2);
    A=B(r(1,2));
    B(r(1,2))=B(r(1,1));
    B(r(1,1))=A;
    A=B;

end