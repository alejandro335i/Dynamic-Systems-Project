% Dynamic Systems & Controls Project 1  
 
clear, close all, clc
disp('First order system transfer function')
disp('G = K/(tau*s+1')
disp('Note - you may need to modify your transfer function to fit this form.')
K = input('K = ');  % input DC Gain
tau = input('tau = ');  % input 1st coefficient on denominator
 
num = [K]           % define numerator coefficients
den = [tau 1]       % define denominator coefficients
 
G = tf(num,den)  % must have Control system toolbox to use function tf
 
G_Poles = pole(G)  % calculates the Poles of the Transfer Function, G
G_zeros = zero(G)  % calculates the Zeros of the Transfer Function, G
 
figure(1)   % creates a new figure window
pzmap(G)    % creates plots of o=zeros and x=poles on S-plane
% axis([-4 0 -3 3])  % optional scaling function if auto scale is bad
 
 
% Caclulating the Settling time (2%) - approx for 1st order system
Ts = 4*tau   % this is for underdamped system -- not meaningful otherwise
 
% Caclulating the Settling time (2%) - approx for 1st order system
Tr = 2.2*tau
 
figure(2)   % creates a new figure window
impulse(G)  % creates the output response to a unit impulse function
% axis([0 10 -3 3])  % optional scaling function if auto scale is bad
 
figure(3)   % creates a new figure window
step(G)     % creates the output response to a unit step function
% axis([0 10 -3 3])  % optional scaling function if auto scale is bad
 
 
% Matlab code to find the response of a system under various inputs:
t = 0:0.01:10;    % going out to 5*tau to get just a little beyond the settling time of 4*tau
r = 10*sin(4*t);   % input now is a sinusoidal waveform with mag 10 and freq 4 rad/s
c = lsim(G,r,t);    % creates the time domain solution for the output c(t) based on the input r and TF G
 
figure(4)
plot(t,r,t,c); %line 47 for problem 5 
xlabel('time (s)')
ylabel('voltage')
title('Input and Output of linear transfer function G')
legend('input','output')

subplot(2,2,1)
pzmap(G)

subplot(2,2,2)
impulse(G)

subplot(2,2,3)
step(G)

subplot(2,2,4)
plot(t,r,t,c)
xlabel('time (s)')
ylabel('voltage')
title('Input and Output of linear transfer function G')
legend('input','output')
