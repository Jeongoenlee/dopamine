% Demo code for dLight analysis 
% written by Jeong Oen Lee,  NIAAA / NIH 
% laboratory for integrative neuroscience (LIN) with Dr.David Lovinger
% Pavlovian training experiment

% photometry system :  Becker & Hickl HPM-100-40



%% Data load 
clear all ; close all;
load('DLS_pav2.mat');

%% Data load and dF/F calculation

for i=1:15  % 15 cs+ trials 
    
    intensity= N{1,i}(:,3);
    baseline=mean(intensity);  % F0 
    data(i,:)= (intensity-baseline)/baseline*100;  % F= (F-F0) / F0
    
end


%% trials data


for m=1:15         %% 15 cs+ trials 
 
   c=[0.5 0.5 0.5];
  
   figure(5); subplot(1,2,1); hold on; plot(time-10,data(m,:),'Color',c)
end

%% average of trials % mean and std of all trials 

for m=1:1:length(data(1,:))  
    
    avg_intensity(m)=mean(data(:,m));
    sem_intensity(m)=std(data(:,m))/sqrt(length(data(:,1)));
    acc_intensity(m)=sum(data(:,m));
    
end

figure(5); subplot(1,2,1); plot(time-10, avg_intensity,'r');
ylim([-1.5 8]);
xlim([-1 7]);
xlabel('time(s)');
ylabel('dF/F');
figure(5); subplot(1,2,2);set(gcf, 'Color', [1 1 1], 'Position', [100 100 200 200], 'PaperPositionMode', 'auto');
hold on;

[~, hp] = boundedline(time-10,avg_intensity,sem_intensity, 'r-', ...
          'alpha','transparency', 0.15);
ylim([-0.01 0.05]);
xlim([-1 10]);
xticks([0 1 2 3 4 5 6 7 8 9 10]);
%plot(time, avg_intensity,'r');
ylim([-1.5 8]);
xlim([-1 7]);
xlabel('time(s)');
ylabel('dF/F');

 x=200;
 y=200;
 width=800;
 height=250;
 set(figure(5), 'Position', [x y width height])
 title('DLS pavlovian example')





