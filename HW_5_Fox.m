% Script/Function Name: HW_5_Fox% Version: 2.1% Date: 2/27/18% Author: Sarvesha Kumar Kombaiah Seetha% Description: This script simulates a fox attempting to capture a rabbit.
% Set Initial conditions
clear
clc
clf
% Initialize
Nts = 20;              % Number of Time Steps
Time = zeros(Nts,1);
Rx = zeros(Nts,1);     % Initial Rabbit Location
Ry = zeros(Nts,1);
Fx = zeros(Nts,1);     % Initial Fox Location
Fy = zeros(Nts,1);% Start and Goal 
Rs = 2;        % Rabbit Speed in m/s
Fs = 3;         % Fox Speed in m/s
Hx = 90;        % Rabbit Hole Location (in m)
Hy = 90;
Rx(1) = 80;     % Initial Rabbit Location
Ry(1) = 50;
Fx(1) = 40;     % Initial FoxLocation
Fy(1) = 70;
% Map Size (Number of grids)
Nx = 20;
Ny = 20;
Gs = 5;   % Grid size in m.
i = 1
Time(1) = 0;
Separation = sqrt((Fx(1)-Rx(1))^2 + (Fy(1)-Ry(1))^2);
% Calculation/AI Module
while Separation > 2 & Time < Nts 
    i = i+1;
    Time(i) = Time(i-1) + 1; % Rabbit AI -run as fast as you can toward the hole.
    % Direction to hole
    Xrh = Hx -Rx(i-1);
    Yrh = Hy -Ry(i-1);
    DistToHole = sqrt(Xrh^2+Yrh^2)
    % Rabbit Velocity components
    VRx = Rs * Xrh/DistToHole;
    VRy = Rs * Yrh/DistToHole;
    % Fox AI -run as fast as you can toward the rabbit.
    % Direction to Rabbit
    Xfr = Rx(i-1) -Fx(i-1);
    Yfr = Ry(i-1) -Fy(i-1);
    % Fox Velocity components
    VFx = Fs * Xfr/Separation;
    VFy = Fs * Yfr/Separation;
    % Move Rabbit and Fox
    Rx(i) = Rx(i-1) + VRx;     % New Rabbit position
    Ry(i) = Ry(i-1) + VRy; 
    Fx(i) = Fx(i-1) + VFx;     % New Fox position
    Fy(i) = Fy(i-1) + VFy; 
    % Calc Separation and determine if Rabbit caught or safe
    Separation = sqrt((Fx(i)-Rx(i))^2 + (Fy(i)-Ry(i))^2)
    if DistToHole < 2
        disp('Rabbit Safe')
    end
    if Separation < 2
        disp('Rabbit Caught')
    end
end
% Output Module
axis([0 5*Nx 0 5*Ny])
title('Map')
grid
hold on
for i = 1:1:Nts
    plot(Rx(i), Ry(i),'gs')
    plot(Fx(i), Fy(i),'rx')
end
plot(Hx(1), Hy(1),'bo')
hold on