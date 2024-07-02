function sv=svtimenew(oe, deltat)
 mew=398600;
 newoe=oe;
 a=newoe(1);
 e=newoe(2);
 i=newoe(3);
 capom=newoe(4);
 smolom=newoe(5);
 theta=newoe(6);
 omeganot=sqrt(mew/(a^3));
 rearth=6371;
 rho=jacrob(a-rearth);
 vnot=omeganot*a;
 ballcoin=4.7e-8;
 alpha=-(vnot^2*rho*ballcoin)/(2*a);
 disp(alpha);
 theta=theta+(omeganot*deltat)+(alpha*deltat*deltat/2);
 if(theta>2*pi)
     theta=theta-2*pi;
 end
 sv=theta;
end