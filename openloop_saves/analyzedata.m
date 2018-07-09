clear all
close all
data = csvread('xp3_stiff_07.csv');
FSR=data(:,1:4);
current=data(:,5);
realpos=data(:,6);
sentpos=data(:,7);
sz=size(data(:,1));
t=[1:1:sz]';
T=[t,t,t,t];
A=ones(size(FSR(:,1),1),1);
spacesens=[A, A*10, A*20, A*30];
plot3(T,spacesens,FSR)
figure
subplot(4,1,1)
plot(FSR(:,1))
title('sensor 1')
ylabel('force (mN)')

subplot(4,1,2)
plot(FSR(:,2))
title('sensor 2')
%xlabel('time (s)')
ylabel('force (mN)')

subplot(4,1,3)
plot(FSR(:,3))
title('sensor 3')
%xlabel('time (s)')
ylabel('force (mN)')

subplot(4,1,4)
plot(FSR(:,4))
title('sensor 4')
xlabel('time (s)')
ylabel('force (mN)')

figure
subplot(2,1,1)
plot(current)
subplot(2,1,2)
plot(realpos)
hold on
plot(sentpos)