clear;  clc;    close all;
v=VideoWriter('myplot.mp4');
v.FrameRate=1;
v.Quality = 95;
open(v);
x= linspace(-5,5,1500);
for r=1:10
    a=1;    b=-1;     alpha=1;    p=-0.6;  epsinot=0.5;   ionot=1; t=1; m=10;
    hold on
    c=-1-(r/m);
    vartheta = ((a/alpha)*x.^alpha)+((b/alpha)*p^alpha)+c*t;
    delta=-(2*c)/(b*a^2);
    z= ((b/(2*a))*((2*c*epsinot-ionot*a*b*sqrt(-delta)*tanh(sqrt(-delta)*vartheta))./(ionot*b-epsinot*a*b*sqrt(-delta)*tanh(sqrt(-delta)*vartheta))).^2);
    hold off
    plot(x,z, 'Linewidth', 2);
%     rlim([0 1.1])
    ylim([-2.1 0.2])
    frame=getframe(gcf);
    writeVideo(v,frame);
    pause(0.01);
    
end

close(v)
