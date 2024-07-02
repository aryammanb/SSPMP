function rk = rungekutta(f, y, t, h, n)
%{
Applying Runge Kutta method to the ODE:
dy/dt=f(t, y)
the step size is h and the number of steps is n.
%}
    while n>0
        k1=f(t, y);
        k2=f(t+h/2, y+h*k1/2);
        k3=f(t+h/2, y+h*k2/2);
        k4=f(t+h, y+h*k3);
        t=t+h;
        y=y+(h/6)*(k1+2*k2+2*k3+k4);
        n=n-1;
        rungekutta(f, y, t, h, n);
    end
    rk= y;
    
end