function sv = svfromcoeusingrotation(oe)
%{
This function takes the orbital elements as input and gives the state
vector in geocentric equitorial(eci frame) by first finding it in perifocal
frame and using rotation matrices
h= specific angular momentum
mew= 398600
e= ecccentricity
i= angle of inclination
capOM= Right ascension of ascending node
smallOM= argument of perigee from node line along plane of orbit
theta= true anomaly
rmag= magnitude of r vector
rperficoal= position vector in perifocal frame
vperifocal= velocity vector in perifocal frame
rotcapom, rotsmallom, rotinc = rotation matrices
%}
mew=398600;
a=oe(1);
e=oe(2);
h=(a*mew*(1-e^2))^0.5;
inc=oe(3);
capOM=oe(4);
smallOM=oe(5);
theta=oe(6);
rmag= h^2/(mew*(1+e*cos(theta)));
rperifocal= [rmag*cos(theta); rmag*sin(theta); 0];
vperifocal = [(mew/h)*-sin(theta); (mew/h)*(e+cos(theta)); 0];
rotcapom= [cos(capOM), sin(capOM), 0;
           -sin(capOM), cos(capOM), 0;
           0,           0,          1];
rotsmallom= [cos(smallOM), sin(smallOM), 0;
           -sin(smallOM), cos(smallOM), 0;
           0,           0,          1];
rotinc= [1,0,0;
    0, cos(inc), sin(inc);
    0, -sin(inc), cos(inc)];
q= rotsmallom*rotinc*rotcapom;
sv=  [transpose(q)*rperifocal; transpose(q)*vperifocal];

end