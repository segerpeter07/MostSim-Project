function Ramp_Sweeper()
    %Global Variables
    m=635;  %(kg)
    g=9.81; %(m/s^s)
    
    ramp_height=[0:0.1:100];
    loop_radius=[0:0.1:100];
    data=[0:0.1:100];
    
    for i=0:0.1:loop_radius.length()
        V=sqrt((2*(m*g*ramp_height(i)))/m);
        data(i)=HereWeGooo(loop_radius(i),V);
    end
    
    contourf(loop_radius,ramp_height,data);
end