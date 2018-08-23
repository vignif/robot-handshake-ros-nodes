close all;
clear all;



FSR= zeros(1200, 1);
force=zeros(1200, 1);
avg=[];
for name={'FSRfromDummy_grams'}
    clear A;
    sumA=zeros(0,2);

   formatSpec='%s.csv';
   filename=sprintf(formatSpec,name{1});
   A=csvread(filename);
   if size(sumA,1)<size(A,1)
       sumA=zeros(size(A));
   end
   fsr = A(:,1);
   force = A(:,2);

end
fsr=fsr/1.422 - 19.47/1.422; %dummy_grams
% fsr=fsr/166.6896 - 9.7041/166.6896; %%dummy_3
    
for i=1:size(fsr,1)
if force(i) < 0
    force(i) = 0;
end
if fsr(i) < 0 
fsr(i) =0;
end
end


% 
% 
% for i=1:max(force)
%     temp = 0;
%     c=0;
%    index= find(force==i);
%     for j=min(index):max(index)
%         temp= temp+fsr(j);
%         c=c+1;
%         j;
%     end
%     avg(i)=temp/c;
% end

scatter(force,fsr); xlabel('Force (N)'); ylabel('sumofFSR'); title('Calibration of FSR from loadcell');
