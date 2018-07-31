close all;
clear all;


number_of_experiments=4;
nam='';
FSR= zeros(13200, 4);
current=zeros(13200,1);
realpos=zeros(13200,1);
sentpos=zeros(13200,1);

for name={'st1_Francesco','st1_Enrico','st1_Matteo','st1_Giovanni','st1_Daniele','st1_Marco','st1_Gionata'}
%for name = {'st1_Daniele'}
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
% 
FSR=FSR/(number_of_experiments+1);
current = current / (number_of_experiments+1);
realpos = realpos / (number_of_experiments+1);
sentpos = sentpos / (number_of_experiments+1);

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
grid on
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
[~,idx] = sort(data(:,7)); % sort just the selected column
sortedmat = data(idx,:);   % sort the whole matrix using the sort indices

x=sortedmat(:,7); %sentpos
x=sortedmat(:,6); %realpos
sumofFSRsorted= sortedmat(:,1)+sortedmat(:,2) + sortedmat(:,3) +sortedmat(:,4); 

F=sumofFSRsorted;
k=F./x;
figure
%subplot(2,1,1)
%plot(x)
%set(gca,'XTick',ticks)
%set(gca,'xticklabel',(tickslabels))
%legend('Referenced Position','Location','south')
%subplot(2,1,2)
plot(k)
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))

legend('k values reordered','Location','north')
%% Remove time dependece
% plot as prof. (qr-q) vs. qr in order to find q0


%% Delete transient from fsrVALUES %%
% each closure position lasts 3seconds let's define the transient as the
% 1st second.

% lets drop from the wholesize(data(:,1)) unsorted matrix the interested rows
% delete every firsts 100 rows each 300. how to do that? 

% FSR_st=data_steady(:,1:4);
% current_st=data_steady(:,5);
% realpos_st=data_steady(:,6);
% sentpos_st=data_steady(:,7);


data=sortedmat;
figure
skip_first=0;
data_cut=cut_transient(data, skip_first);
% skip_first=100;
subplot(3,2,1)
scatter(data_cut(:,7), data_cut(:,7)-data_cut(:,6)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')

skip_first=20;
data_cut=cut_transient(data, skip_first);
% skip_first=100;
subplot(3,2,2)
scatter(data_cut(:,7), data_cut(:,7)-data_cut(:,6)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')

skip_first=40;
data_cut=cut_transient(data, skip_first);
% skip_first=100;
subplot(3,2,3)
scatter(data_cut(:,7), data_cut(:,7)-data_cut(:,6)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')

skip_first=60;
data_cut=cut_transient(data, skip_first);
% skip_first=100;
subplot(3,2,4)
scatter(data_cut(:,7), data_cut(:,7)-data_cut(:,6)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')

skip_first=80;
data_cut=cut_transient(data, skip_first);
% skip_first=100;
subplot(3,2,5)
scatter(data_cut(:,7), data_cut(:,7)-data_cut(:,6)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')

skip_first=100;
data_cut=cut_transient(data, skip_first);
% skip_first=100;
subplot(3,2,6)
scatter(data_cut(:,7), data_cut(:,7)-data_cut(:,6)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')
sumofFSRcutted= data_cut(:,1)+data_cut(:,2)+data_cut(:,3)+data_cut(:,4);
figure
scatter(data_cut(:,7),sumofFSRcutted); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('sumofFSR')

% The error between reference and the output position can be modeled from
% the input of FSR sensors only in the range when the error is high
% (>14000) aproximaly. in this way we can have a model of the force
% (tracking error) having as inputs the FSR sensors.

%% TASKS
% t1 - how to identify (q0)? the position in which the tracking error is relevant
% t2 - create a model between INPUT -> FSRsensors and OUTPUT -> tracking
% error
% t3 - does this model makes sense?
% t4 - use the model for the closed loop controller
% t5 - evaluate the model with different participants

dataid=iddata(sumofFSRcutted, data_cut(:,7)-data_cut(:,6),0.01);
mm = tfest(dataid,5,2);
T=[0:0.01:0.01*size(data_cut(:,1))-0.01];
y=lsim(mm,data_cut(:,7),T);
plot(y,'r')
hold on;
plot(sumofFSRcutted,'b')
legend('Model','sum of FSR')