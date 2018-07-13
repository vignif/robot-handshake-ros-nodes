clear all
close all
data = csvread('st1_step_francesco.csv');
FSR=data(:,1:4);
current=data(:,5);
realpos=data(:,6);
sentpos=data(:,7);
sz=size(data(:,1));
t=[1:1:sz]';
T=[t,t,t,t];
A=ones(size(FSR(:,1),1),1);
spacesens=[A, A*10, A*20, A*30];

sumofFSR= FSR(:,1)+FSR(:,2) + FSR(:,3) +FSR(:,4); 
m=0;
for i=1 : size(FSR(1,:),2)

    if m < max(FSR(:,i))
        m=max(FSR(:,i));
    end
    
end
scaleFSR = m*1.2;

% plot(sumofFSR)
% hold on
% plot(realpos,'r')
% plot(sentpos,'g')
% lgd=legend('Sum of FSR', 'Real Position','Reference Position','Location','southeast')
% title('Stiffness = 0.9')
% axis([500 700 2000 18000])
% figure 
plot3(T,spacesens,FSR)
figure
s1 = subplot(4,1,1);
plot(FSR(:,1))
title('sensor 1')
ylabel('force (mN)')

s2 = subplot(4,1,2);
plot(FSR(:,2))
title('sensor 2')
xlabel('time (s)')
ylabel('force (mN)')

s3 = subplot(4,1,3);
plot(FSR(:,3))
title('sensor 3')
xlabel('time (s)')
ylabel('force (mN)')

s4 = subplot(4,1,4);
plot(FSR(:,4))
title('sensor 4')
xlabel('time (s)')
ylabel('force (mN)')
axis([s1 s2 s3 s4],[0 size(FSR(:,1),1) 0 scaleFSR])


figure
subplot(2,1,1)
plot(current)
ylabel('Current')
subplot(2,1,2)
plot(realpos)
ylabel('Position')
hold on
plot(sentpos,'r')
legend('Real Position','Referenced Position','Location','southeast')
axis([0 size(FSR(:,1),1) -2000 17000])

figure
plot(sumofFSR)
hold on
plot(sentpos,'r')
legend('Sum of FSR', 'Referenced Position', 'Location','southeast')