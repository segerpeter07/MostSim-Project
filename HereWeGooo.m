function HereWeGooo()

%Define variables
cart_mass = 535;                        %kg, mass of cart no people
person_mass = 100;                      %kg, mass of 1 person
rolling_mass = cart_mass + person_mass; %kg, mass of person+cart
m = rolling_mass;                       %ez pz

R = 10;         %m, radius of the roller coaster loop
g = 9.81;       %m/s^2, acceleration due to gravity
mu = 0.0009;    %coefficient of rolling resistance


    function res = S_derivs(~,S)
        s = S(1);   %current s (position)
        sdot = S(2);%current sdot (velocity)
        
        
        sdd = (((((m*(sdd*sin(s) - sdot^2*cos(s)))/(cos(s)*(1-mu)))*sin(s) - ((m*(sdd*sin(s) - sdot^2*cos(s)))/(cos(s)*(1-mu)))*mu*sin(s) - m*g)/m + sdot^2*sin(s)))/cos(s);
        Fn = ((m*(sdd*sin(s) - sdot^2*cos(s)))/(cos(s)*(1-mu)));








end

