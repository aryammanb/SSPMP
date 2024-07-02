function rvlist(oe)
    oearray=mastercontrol(oe);
    timep=2*pi*(oe(1)^1.5)/398600^0.5;
    slowerupdatedeltat=60*round(timep/60);
    svarray=zeros(150*95*60, 6);
    for i=1:(150*95*60)
        n=floor(i/slowerupdatedeltat);
        initialsv=svfromcoeusingrotation(oearray(n+1, :));
        deltat=i-slowerupdatedeltat*n;
        final_sv=statevectortime(initialsv, deltat);
        svarray(i, :)=final_sv;
        disp(real(svarray(i, :)));
    end
end