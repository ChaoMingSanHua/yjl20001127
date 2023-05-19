clear;
close all;
clc;

format long;

tf = 20; 
dt = 0.01;
t = [0:dt:tf]';
k(1:length(t)) = 0;  
k = k';
T1(1:length(t)) = 0;
T2(1:length(t)) = 0;
% T1 = T1';
% T2 = T1;
T1 = T1';
T2 = T2';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
M = 10;
Xsum = [];
Ysum = [];
for i = 0:1:M   

    pause(0.01);
    
    simOut = sim('SimMain', [0, tf]);
    
    xd = simOut.xd;
    yd = simOut.yd;

    x = simOut.x;
    y = simOut.y;
    T1 = simOut.T1.data;
    T2 = simOut.T2.data;
    k = simOut.k.data;
    
    Xsum = [Xsum, x.data];
    Ysum = [Ysum, y.data];
    
    figure(1);
    plot(xd.data, yd.data, 'b');
    hold on;
    plot(x.data, y.data, 'r-');
    
    disp(i);
    disp(mean(abs(xd.data - x.data)));
    disp(mean(abs(yd.data - y.data)));
end

figure(2);
plot(xd.data, yd.data, 'b');
hold on;
plot(Xsum(:, 1), Ysum(:, 1), 'g-');
hold on;
plot(Xsum(:, end), Ysum(:, end), 'r-');