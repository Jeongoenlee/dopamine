% Demo code for dLight analysis 
% written by Jeong Oen Lee,  NIAAA / NIH 
% laboratory for integrative neuroscience (LIN) with Dr.David Lovinger
% Pavlovian training experiment

% photometry system :  Becker & Hickl HPM-100-40

clear all;
close all;

load('DLS_pav2.mat');  % load 'time' and 'data' 


for m=1:19         %% 19 trials in  'data' 
 
   c=[0.5 0.5 0.5];
   figure(5); subplot(1,2,1); hold on; plot(time,data(m,:),'Color',c)
end



for m=1:1:length(data(1,:))   % mean and std of 19 trials 
    
    avg_intensity(m)=mean(data(:,m));
    sem_intensity(m)=std(data(:,m))/sqrt(length(data(:,1)));
    acc_intensity(m)=sum(data(:,m));
    
end

figure(5); subplot(1,2,1); plot(time, avg_intensity,'r');
ylim([-0.02 0.08]);
xlim([-1 7]);
figure(5); subplot(1,2,2);set(gcf, 'Color', [1 1 1], 'Position', [100 100 200 200], 'PaperPositionMode', 'auto');
hold on;

[~, hp] = boundedline(time,avg_intensity,sem_intensity, 'r-', ...
          'alpha','transparency', 0.15);
ylim([-0.01 0.05]);
xlim([-1 10]);
xticks([0 1 2 3 4 5 6 7 8 9 10]);
%plot(time, avg_intensity,'r');
ylim([-0.02 0.08]);
xlim([-1 7]);

 x=200;
 y=200;
 width=800;
 height=200;
 set(figure(5), 'Position', [x y width height])
 title('DLS pavlovian example')





