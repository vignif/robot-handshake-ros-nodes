close all;
clear all;
% %% if step signal
% sz=1200;
%% if pseudorandom signals


number_of_sensors=2;
number_of_experiments=5;



idx_current = 5-(4-number_of_sensors);
idx_realpos = 6-(4-number_of_sensors);
idx_sentpos = 7-(4-number_of_sensors);
nam='';
%% define big hand and small hand
big_hands={'st1_Gionata','st1_Francesco','st1_Marco','st1_Matteo'};
small_hands={'st1_Enrico','st1_Giovanni','st1_Daniele'};
names ={'st1_Francesco','st1_Enrico','st1_Matteo','st1_Giovanni','st1_Daniele','st1_Marco','st1_Gionata'};
% names = {'st1_stepnull'}

%% define q0 per participant
%
% data.name = {'st1_Francesco','st1_Enrico','st1_Matteo','st1_Giovanni','st1_Daniele','st1_Marco','st1_Gionata'};
q0 = [10000,12000,10500,11000,11000,10000,10500];
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
    %for name = {'st1_stepnull'}
    clear A;
    sumA=zeros(0,2);
    
    for i=0:number_of_experiments-1
        formatSpec='%s%d.csv';
        filename=sprintf(formatSpec,name{1},i);
        A=csvread(filename);
        if size(sumA,1)<size(A,1)
            sumA=zeros(size(A));
        end
        
        if ~exist('FSR')
            sz=size(A,1);
            FSR= zeros(sz, number_of_sensors);
            current=zeros(sz,1);
            realpos=zeros(sz,1);
            sentpos=zeros(sz,1);
            idx_current = 5;
            idx_realpos = 6;
            idx_sentpos = 7;
        end
        
        FSR = FSR + A(:,1:number_of_sensors);
        %FSR=[FSR; A(:,1:4)];
        %curr=[curr; A(:,5)];
        current= current + A(:,idx_current);
        realpos = realpos + A(:,idx_realpos);
        sentpos = sentpos + A(:,idx_sentpos);
        %   realpos=[realpos; A(:,6)];
        %  sentpos=[sentpos; A(:,7)];
        %sentpos = sentpos-data(7).q0
    end
    %
    FSR=FSR/(number_of_experiments+1);
    current = current / (number_of_experiments+1);
    realpos = realpos / (number_of_experiments+1);
    sentpos = sentpos / (number_of_experiments+1);
    
    c=c+1;
end

%% apply model to scale fsr values to Newtons
syms x
p1=0.000000002863;
p2=-0.00001851;
p3=0.04863;
model =@(x) p1*x.^3+p2*x.^2+p3*x;
FSR=model(FSR);

%%
if sz(:,1)==13200
    ticks = [0 2000 4000 6000 8000 10000 12000 14000];
    tickslabels = [0 20 40 60 80 100 120 140];
    idx_current = 5;
    idx_realpos = 6;
    idx_sentpos = 7;
    
end

if sz(:,1)==1200
    ticks = [0 200 400 600 800 1000 1200];
    tickslabels = [0 1 2 3 4 5 6];
    idx_current = 5-(4-number_of_sensors);
    idx_realpos = 6-(4-number_of_sensors);
    idx_sentpos = 7-(4-number_of_sensors);
    
end


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

if sz(:,1)==13200
    ticks = [0 2000 4000 6000 8000 10000 12000 14000];
    tickslabels = [0 20 40 60 80 100 120 140];
end

if sz(:,1)==1200
    ticks = [0 200 400 600 800 1000 1200];
    tickslabels = [0 1 2 3 4 5 6];
end

% plot3(T,spacesens,FSR)
% figure

%% figure 1
%sensors in vertical subplots
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


%% figure 2
% current subplot and ref_pos with real_pos subplo
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
legend('q_{output}','q_{ref}','Location','southeast')
axis([0 size(FSR(:,1),1) 0 17000])
xlabel('time (s)')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))

%% figure 3
figure

subplot(2,1,1)

plot(realpos,'m')
hold on
plot(sentpos,'r')
grid on
axis([0 size(FSR(:,1),1) 0 17000])
legend('q_{output}','q_{ref}','Location','south')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))
ylabel('q')
title('Closure position in pseudorandom experiment')
subplot(2,1,2)
plot(sumofFSR)
grid on

title('Force from FSRs in pseudorandom experiment')

xlabel('time (s)')
ylabel('force (N)')

%legend('Force','Location','northwest')
set(gca,'XTick',ticks)
set(gca,'xticklabel',(tickslabels))

%title('sum of FSR')
%legend('Sum of FSR', 'q_{output}','q_{ref}','Location','southeast')

%% SORT ARRAY
data=[FSR, current, realpos, sentpos];
idx_sentpos=size(data,2);
idx_realpos=size(data,2)-1;
idx_current=size(data,2)-2;
[~,idx] = sort(data(:,idx_sentpos)); % sort just the selected column
sortedmat = data(idx,:);   % sort the whole matrix using the sort indices

x=sortedmat(:,idx_sentpos); %sentpos
x=sortedmat(:,idx_realpos); %realpos
sumofFSRsorted=sum(sortedmat(:,1:number_of_sensors),2);

F=sumofFSRsorted;
k=F./x;
%% figure 4
figure
%subplot(2,1,1)
%plot(x)
%set(gca,'XTick',ticks)
%set(gca,'xticklabel',(tickslabels))
%legend('q_{ref}','Location','south')
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
%% figure 5
figure
% Plot data transient cutted
count=1;
for skip_first=0:20:100
    data_cut=cut_transient(data, skip_first);
    % skip_first=100;
    subplot(3,2,count)
    scatter(data_cut(:,idx_sentpos), data_cut(:,idx_sentpos)-data_cut(:,idx_realpos)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')
    count=count+1;
end

%% figure 6
figure
% Plot data transient cutted
count=1;
for skip_first=0:20:100
    data_cut=cut_transient(data, skip_first);
    % skip_first=100;
    subplot(3,2,count)
    scatter(data_cut(:,idx_sentpos), sum(data_cut(:,1:number_of_sensors),2)); title(sprintf('cutted transient: %d / 3',skip_first)); xlabel('qr'); ylabel('force (N)')
%     hold on
%     scatter(data_cut(:,idx_sentpos), std(data_cut(:,1:number_of_sensors))); title(sprintf('std for transient: %d / 300',skip_first)); xlabel('qr'); ylabel('force (N)')

    count=count+1;
end

% %% figure 6 EVAL STD
% 
% count=1;
% for skip_first=0:20:100
%     data_cut=cut_transient(data, skip_first);
%     % skip_first=100;
%     vect = [1:size(data_cut,1)];
%     subplot(3,2,count)
%     scatter(vect,data_cut(:,6)); title(sprintf('cutted transient: %d / 300',skip_first));
%     count=count+1;
% end

% figure
% count=1;
% for skip_first=0:20:100
% val=find_std(data,skip_first);
%  subplot(3,2,count)
%     scatter(val,unique(data_cut(:,5))); title(sprintf('cutted transient: %d / 300',skip_first));
%     count=count+1;
% end


%% figure 6
% FIT model to the following plot Force VS q

sumofFSRcutted= sum(data_cut(:,1:number_of_sensors),2);
force=sumofFSRcutted;
q=data_cut(:,idx_sentpos);
figure

scatter(force,q); title(sprintf('q vs. force with transient filter: %d.0 second',skip_first/100)); xlabel('qr');ylabel('force (N)')
axis([0 120 4500 19000])
grid on

% cftool(force,q)
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