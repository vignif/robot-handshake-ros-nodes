close all;
clear all;


number_of_experiments=4;
nam='';
FSR= zeros(13200, 4);
current=zeros(13200,1);
realpos=zeros(13200,1);
sentpos=zeros(13200,1);

%for name={'st1_Francesco','st1_Enrico','st1_Matteo','st1_Marco','st1_Giovanni'}
for name = {'st1_Daniele'}
    clear A;
    sumA=zeros(0,2);

for i=0:number_of_experiments-1
   formatSpec='%s%d.csv';
   filename=sprintf(formatSpec,name{1},i);
   A=csvread(filename);
   if size(sumA,1)<size(A,1)
       sumA=zeros(size(A));
   end
   
   FSR = FSR + A(:,1:4);
   %FSR=[FSR; A(:,1:4)];
   %curr=[curr; A(:,5)];
   current= current + A(:,5);
   realpos = realpos + A(:,6);
   sentpos = sentpos + A(:,7);
%   realpos=[realpos; A(:,6)];
 %  sentpos=[sentpos; A(:,7)];
end

FSR=FSR/number_of_experiments;
current = current / number_of_experiments;
realpos = realpos / number_of_experiments;
sentpos = sentpos / number_of_experiments;

end


sz=size(A(:,1));
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


ticks = [0 2000 4000 6000 8000 10000 12000 14000];
tickslabels = [0 20 40 60 80 100 120 140];


plot3(T,spacesens,FSR)
figure
s1 = subplot(4,1,1);
plot(FSR(:,1))
title('sensor 1')
ylabel('force (mN)')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))


s2 = subplot(4,1,2);
plot(FSR(:,2))
title('sensor 2')
xlabel('time (s)')
ylabel('force (mN)')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))


s3 = subplot(4,1,3);
plot(FSR(:,3))
title('sensor 3')
xlabel('time (s)')
ylabel('force (mN)')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))



s4 = subplot(4,1,4);
plot(FSR(:,4))
title('sensor 4')
xlabel('time (s)')
ylabel('force (mN)')
axis([s1 s2 s3 s4],[0 size(FSR(:,1),1) 0 scaleFSR])
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))

figure
ax1 = subplot(2,1,1);
plot(current)
ylabel('Current')
axis([0 size(FSR(:,1),1) min(current)*1.2 max(current)*1.2])
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))
ax2 = subplot(2,1,2);
plot(realpos)
ylabel('Position')
hold on
plot(sentpos,'r')
legend('Real Position','Referenced Position','Location','southeast')
axis([0 size(FSR(:,1),1) 0 17000])
xlabel('time (s)')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))


figure
subplot(2,1,1)
plot(realpos,'m')
hold on
plot(sentpos,'r')
legend('Real Position','Referenced Position','Location','south')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))

subplot(2,1,2)
plot(sumofFSR)
legend('Sum of FSR','Location','north')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))

%title('sum of FSR')
%legend('Sum of FSR', 'Real Position','Referenced Position','Location','southeast')

%% SORT ARRAY
data=[FSR, current, realpos, sentpos];
[~,idx] = sort(data(:,7)); % sort just the first column
sortedmat = data(idx,:);   % sort the whole matrix using the sort indices

x=realpos;
F=sumofFSR;
k=F./x;

sumofFSRsorted= sortedmat(:,1)+sortedmat(:,2) + sortedmat(:,3) +sortedmat(:,4); 
