function nr= newtonraphson(m, e)
%{
M= E-esinE
Solving for E computationally given M and e.
function for Newton Raphson; E-esinE-M
Initial Guess= M+e/2 if M<pi else M-e/2
m=M
e=e
ecan=E
%}
if m<pi
    ecan=m+e/2;
else 
    ecan=m-e/2;
end
f= ecan-e*sin(ecan)-m;
fdash= 1-e*cos(ecan);
ratio=f/fdash;
tolerance=1e-8;
while abs(ratio)>tolerance
    ecan = ecan - ratio;
    f= ecan-e*sin(ecan)-m;
    fdash= 1-e*cos(ecan);
    ratio=f/fdash;
end
nr = ecan;
end
