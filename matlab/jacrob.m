function jr=jacrob(h)
rtd = 180.0 / pi;
dtr = pi / 180.0;
% initialize the algorithm
j70iniz;
% algorithm inputs
%  indata(1)  = geodetic altitude (kilometers)
%  indata(2)  = geodetic latitude (radians)
%  indata(3)  = geographic longitude (radians)
%  indata(4)  = calendar year (all digits)
%  indata(5)  = calendar month
%  indata(6)  = calendar day
%  indata(7)  = utc hours
%  indata(8)  = utc minutes
%  indata(9)  = geomagnetic index type
%               (1 = indata(12) is Kp, 2 = indata(12) is Ap)
%  indata(10) = solar radio noise flux (jansky)
%  indata(11) = 162-day average F10 (jansky)
%  indata(12) = geomagnetic activity index
indata(1) = h;
indata(2) = -21.0 * dtr;
indata(3) = 90 * dtr;
indata(4) = 1979;
indata(5) = 6;
indata(6) = 3;
indata(7) = 0;
indata(8) = 0;
indata(9) = 2;
indata(10) = 60.07;
indata(11) = 109.56;
indata(12) = 9.3;
day = indata(6) + indata(7) / 24.0 + indata(8) / 1440.0;
jdate = julian(indata(5), day, indata(4));
[cdstr, utstr] = jd2str(jdate);
% compute atmospheric properties
outdata = jatmos70(indata);
% algorithm outputs
%  outdata(1)  = exospheric temperature (deg K)
%  outdata(2)  = temperature at altitude (deg K)
%  outdata(3)  = N2 number density (per meter-cubed)
%  outdata(4)  = O2 number density (per meter-cubed)
%  outdata(5)  = O number density (per meter-cubed)
%  outdata(6)  = A number density (per meter-cubed)
%  outdata(7)  = He number density (per meter-cubed)
%  outdata(8)  = H number density (per meter-cubed)
%  outdata(9)  = average molecular weight
%  outdata(10) = total density (kilogram/meter-cubed)
%  outdata(11) = log10(total density)
%  outdata(12) = total pressure (pascals)
% print results
jr=(outdata(10)*10^9);
