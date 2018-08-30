close all;
clear all;
sz=13200;
number_of_sensors=2;
number_of_experiments=5;
nam='';
FSR= zeros(sz, number_of_sensors);
current=zeros(sz,1);
realpos=zeros(sz,1);
sentpos=zeros(sz,1);

idx_current = 5-(4-number_of_sensors);
idx_realpos = 6-(4-number_of_sensors);
idx_sentpos = 7-(4-number_of_sensors);
%% define big hand and small hand
big_hands={'st1_Gionata','st1_Francesco','st1_Marco','st1_Matteo'};
small_hands={'st1_Enrico','st1_Giovanni','st1_Daniele'};

%% define q0 per participant
% 
% data.name = {'st1_Francesco','st1_Enrico','st1_Matteo','st1_Giovanni','st1_Daniele','st1_Marco','st1_Gionata'};
q0 = [10000,12000,10500,11000,11000,10500];
names = {'st1_Francesco','st1_Enrico','st1_Matteo','st1_Giovanni','st1_Daniele','st1_Gionata'};
names= {'st1_Francesco','st1_Enrico','st1_Matteo','st1_Giovanni'};
n_partecipants = size(names,2);
c=0;
for name=names
c=c+1;
data(c).name=name;
data(c).q0=q0(c);
end
clear c;

%% Main loading loop
c=1;
for name=names
%for name = {'st1_Gionata'}
    clear A;
    sumA=zeros(0,2);

for i=1:number_of_experiments
   formatSpec='%s%d.csv';
   filename=sprintf(formatSpec,name{1},i-1);
   A=csvread(filename);
   if size(sumA,1)<size(A,1)
       sumA=zeros(size(A));
   end

   FSR = FSR + A(:,1:number_of_sensors);
   current= current + A(:,5);
   realpos = realpos + A(:,6);
   sentpos = sentpos + A(:,7);
%   realpos=[realpos; A(:,6)];
 %  sentpos=[sentpos; A(:,7)];
 %sentpos = sentpos-data(c).q0;
end

c=c+1;
end

FSR=FSR/(number_of_experiments);
current = current / (number_of_experiments);
realpos = realpos / (number_of_experiments);
sentpos = sentpos / (number_of_experiments);

FSR=FSR/(n_partecipants);
current = current / (n_partecipants);
realpos = realpos / (n_partecipants);
sentpos = sentpos / (n_partecipants);

%% apply model to scale fsr values to Newtons
syms x
p1=0.000000002863;
p2=-0.00001851;
p3=0.04863;
model =@(x) p1*x.^3+p2*x.^2+p3*x;
FSR=model(FSR);



%%


sz=size(A(:,1));
t=[1:1:sz]';
A=ones(size(FSR(:,1),1),1);
T=[];
spacesens=[];
for i=1:number_of_sensors
T=[T,t];
spacesens=[spacesens, A+100];
end



sumofFSR=sum(FSR,2);

% sumofFSR= FSR(:,1)+FSR(:,2) + FSR(:,3) +FSR(:,4); 
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

for i=1:number_of_sensors
s(i) = subplot(number_of_sensors,1,i);
plot(FSR(:,i))
title(['sensor ' num2str(i) ])
ylabel('force (mN)')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))
end

axis(s,[0 size(FSR(:,1),1) 0 scaleFSR])
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
[~,idx] = sort(data(:,idx_sentpos)); % sort just the selected column
sortedmat = data(idx,:);   % sort the whole matrix using the sort indices

x=sortedmat(:,idx_sentpos); %sentpos
x=sortedmat(:,idx_realpos); %realpos
sumofFSRsorted=sum(sortedmat(:,1:number_of_sensors),2);

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
%% Plot data transient cutted 
count=1;
for skip_first=0:20:100
data_cut=cut_transient(data, skip_first);
% skip_first=100;
subplot(3,2,count)
scatter(data_cut(:,idx_sentpos), data_cut(:,idx_sentpos)-data_cut(:,idx_realpos)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')
count=count+1;
end

sumofFSRcutted= sum(data_cut(:,1:number_of_sensors),2);
force=sumofFSRcutted;
q=data_cut(:,idx_sentpos);

figure
%% FIT model to the following plot Force VS q
scatter(q,sumofFSRcutted); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('sumofFSR')

%cut the zeros
hold on 
scatter(q(q>0),sumofFSRcutted(q>0)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('sumofFSR')
cftool(force,q)

% cftool(force(q>0),q(q>0))
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
% figure
% dataid=iddata(sumofFSRcutted, data_cut(:,idx_sentpos)-data_cut(:,idx_realpos),0.01);
% mm = tfest(dataid,5,2);
% T=[0:0.01:0.01*size(data_cut(:,1))-0.01];
% y=lsim(mm,data_cut(:,idx_sentpos),T);
% plot(y,'r')
% hold on;
% plot(sumofFSRcutted,'b')
% legend('Model','sum of FSR')