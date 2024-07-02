function mc= mastercontrol(oe)
sv=svfromcoeusingrotation(oe);
timep=2*pi*(oe(1)^1.5)/398600^0.5;
display(timep);
fasterupdatedeltat=60;
slowerupdatedeltat=60*round(timep/60);
n=slowerupdatedeltat/fasterupdatedeltat;
it=150;
svarray=real(zeros(it*n, 6));
svarray(1, :)=sv;
oearray=zeros(it+1, 6);
oearray(1, :)=oe;
for i=1:it
    %for j=1:n
      %  sv=(statevectortime([real(sv(1)), real(sv(2)), real(sv(3)), real(sv(4)), real(sv(5)), real(sv(6))], fasterupdatedeltat));
       % svarray((i-1)*n+j, :)=sv;
        %uisp(sv);
    %end
    newoe=updateelements(oe, slowerupdatedeltat);\
    newsv=svtimenew(svfromcoeusingrotation(oe), slowerupdatedeltat);
    newnewnewoe=coe_from_sv([sv(1), newsv(2), newsv(3)], [newsv(4), newsv(5), newsv(6)], 398600);
    newoe(6)=newnewnewoe(6);
    oe=newoe;
    oearray(i+1, :)=oe;
    sv=svfromcoeusingrotation(oe);
    %disp(oearray(i, :));
end
mc=oearray;
end