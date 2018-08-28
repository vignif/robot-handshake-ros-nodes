close all;
clear all;

FSR= zeros(1200, 1);
force=zeros(1200, 1);
avg=[];
for name={'FSRfromDummy_oneside1'}
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

% remove negative values for fsr and force
eps=0.01;
for i=1:size(fsr,1)
if force(i) <= eps
    force(i) = eps;
end
if fsr(i) <= eps
fsr(i) =eps;
end
end

scatter(fsr,force); ylabel('Force (N)'); xlabel('sumofFSR'); title('Calibration of FSR from loadcell');
