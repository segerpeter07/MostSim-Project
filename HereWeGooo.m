function HereWeGooo()

%Define variables
cart_mass = 535;                        %kg, mass of cart no people
person_mass = 100;                      %kg, mass of 1 person
rolling_mass = cart_mass + person_mass; %kg, mass of person+cart
m = rolling_mass;                       %ez pz

R = 100;         %m, radius of the roller coaster loop
g = 9.81;       %m/s^2, acceleration due to gravity
mu = 0.9009;    %coefficient of rolling resistance


    function res = S_derivs(~,S)
        
        s = S(1);   %current s (position)
        sdot = S(2);%current sdot (velocity)

%         sdd = -(g*cos(s))/(cos(s)^2 - sin(s)^2);
%         sdd = (sdot^2*sin(s)-tan(s)*sdot*cos(s)-g)/(cos(s)-tan(s)*sin(s))
%         sdd = ((-2*sdot^2*sin(s)*cos(s) - g*cos(s))/(cos(s)^2 + sin(s)^2));
%         sdd=(sdot^2*sin(s)-tan(s)*sdot^2*cos(s)-g)/(cos(s)+tan(s)*sin(s));
%<<<<<<< HEAD
%         sdd = (-2*sdot^2*sin(s)*cos(s) - g*cos(s))
%         sdd = - g*cos(s);
%           if sdd<10e-9
%               sdd=0.000001;
%           else
%             sdd=(m*sdot*cos(s)*(R*tan(s)-mu*R*tan(s))-m*sdot^2*sin(s)+m*g)/(m*sin(s)*(R*tan(s)-mu*R*tan(s))-m*cos(s));
%           end
            
%             sdd=(m*sdot^2*sin(s)-m*g-tan(s)*((1-mu)/(1+mu))*m*sdot^2*cos(s))/(m*cos(s)+m*sin(s)*tan(s)*((1-mu)/(1+mu)));
            sdd=(-sdot^2*cos(s)*sin(s)-mu*sign(sdot)*sdot^2*sin(s)*cos(s)+m*sdot^2*sin(s)*cos(s)-m*g*cos(s)+mu*sign(sdot)*sdot^2*cos(s)*sin(s)-mu*sign(sdot)*m*g*cos(s))/((sin(s)^2)+mu*sign(sdot)*sin(s)+m*(cos(s)^2)+mu*sign(sdot)*(cos(s)^2));
        res = [sdot; sdd];
    end

% options = odeset('RelTol', 1e-6);
% [t,S] = ode45(@S_derivs, [0 4], [pi/4,-2],options);
%=======
%         sdd = -2*sdot^2*sin(s)*cos(s) - g*cos(s);
%         sdd=((m*sdot^2*cos(s))*(R*tan(s)-mu*R*tan(s))-m*sdot^2*sin(s)+m*g)/((m*sin(s))*(R*tan(s)-mu*R*tan(s))-m*cos(s));
%           
%         res = [sdot; sdd];
%     end

options = odeset('RelTol', 1e-10);
[t,S] = ode45(@S_derivs, [0 5], [pi,4],options);
%>>>>>>> origin/master

Ss = S(:,1);
%sdots = S(:,2);

%<<<<<<< HEAD
% plot(t,Ss)
% rx = R*cos(Ss);
% ry = R*sin(Ss);
% %=======
% %plot(t,Ss)
rx = cos(Ss);
ry = sin(Ss);
%>>>>>>> origin/master

comet(rx,ry)

% sdd = ((((m*(sdd*sin(s) - sdot^2*cos(s)))/(cos(s)*(1-mu)))*sin(s) - ((m*(sdd*sin(s) - sdot^2*cos(s)))/(cos(s)*(1-mu)))*mu*sin(s) - m*g)/m + sdot^2 * sin(s) - sdd)






end

