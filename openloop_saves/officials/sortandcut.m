close all;
clear all;


number_of_experiments=5;
nam='';
FSR= zeros(13200, 4);
current=zeros(13200,1);
realpos=zeros(13200,1);
sentpos=zeros(13200,1);

for name={'st1_Francesco','st1_Enrico','st1_Matteo','st1_Giovanni','st1_Daniele','st1_Marco','st1_Gionata'}
%for name = {'st1_Gionata'}
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


%% SORT ARRAY
% sort the matrix ascending with the sentpos

data=[FSR, current, realpos, sentpos];
[~,idx] = sort(data(:,7)); % sort just the selected column
sortedmat = data(idx,:);   % sort the whole matrix using the sort indices

i=sortedmat(:,5); %current
q=sortedmat(:,6); %realpos
qr=sortedmat(:,7); %sentpos
% FSRsensors
sumofFSRsorted= sortedmat(:,1)+sortedmat(:,2) + sortedmat(:,3) +sortedmat(:,4); 
% 
%% Remove time dependece
% plot as prof. (qr-q) vs. qr in order to find q0
scatter(qr,qr-q); title('tracking error'); xlabel('qr'); ylabel('qr-q')

% till now we have sorted data according to the reference (:,7) but without
% dealing with the transient

%% Delete transient  %%
% each closure position lasts 3seconds let's define the transient as the
% 1st second.

% lets drop from the whole size(data(:,1)) sorted matrix the interested rows
% delete every firsts 100 rows each 300. how to do that? 

% FSR_st=data_steady(:,1:4);
% current_st=data_steady(:,5);
% realpos_st=data_steady(:,6);
% sentpos_st=data_steady(:,7);

% consider the sorted matrix
% data=data;
% --> OR <--
% consider the sorted matrix
data=sortedmat;

% a value is set in order to not consider the transients
skip_first=100;

% function to cut the transient
data_cut=cut_transient(data, skip_first);

% size considerations: the full dataset is currently composed by 13200 rows
% where each 100 rows is a second and each reference signal lasts 3 seconds
% we are getting rid of the first second of each signal (in total 44) so
% the size of the cleaned data matrix should be 13200 - 44*100 which is
% equal to 8800 so all is good.

% plot (qr vs qr-q)
figure
scatter(data_cut(:,7), data_cut(:,7)-data_cut(:,6)); title(sprintf('cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('qr-q')

sumofFSRsortedcutted= data_cut(:,1)+data_cut(:,2)+data_cut(:,3)+data_cut(:,4);
figure
scatter(data_cut(:,7),sumofFSRsortedcutted); title(sprintf('sorted and cutted transient: %d / 300',skip_first)); xlabel('qr'); ylabel('sumofFSR')

data_cutted_sorted = data_cut;
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


dataid=iddata(sumofFSRsortedcutted(4000:end), data_cut(4000:end,7)-data_cut(4000:end,6),0.01);
mm = tfest(dataid,5,2);
T=[0:0.01:0.01*size(data_cut(4000:end,1))-0.01];
y=lsim(mm,data_cut(4000:end,7),T);
figure
plot(y,'r')
hold on;
plot(sumofFSRsortedcutted(4000:end),'b')
legend('Model','sum of FSR')

y= @(x) 0.00014 * x.^2 -2.5 * x + 13000;
model=[];
for x=0:1:19000
model = [ model ;x, ceil(y(x)) ];
end 
for i=1:find(model(:,2)==min(model(:,2)))
model(i,2)=min(model(:,2));
end

figure
plot(model(:,1),model(:,2));xlabel('qr'); ylabel('sumofFSR')

csvwrite('model1.csv',model)