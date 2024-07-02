function cosntantupdater(oe, t)
    timeofupdate=15*60;
    n=floor(t/timeofupdate);
    currentelements=oe;
    disp(currentelements);
    oearray=zeros(n+2, 6);
    oearray(1, :)=currentelements;
    for i=1:n
        newelements=updateelements(currentelements, timeofupdate);
        disp(newelements);
        newelements(6)=svtimenew(currentelements, timeofupdate);
        currentelements=newelements;
        disp(currentelements);
        oearray(i+1, :)= currentelements;
    end
    extrat=t-n*timeofupdate;
    newelements=updateelements(currentelements, extrat);
    disp(newelements);
    newelements(6)=svtimenew(currentelements, extrat);
    currentelements=newelements;
    disp(currentelements);
    oearray(n+2, :)=currentelements;
end
