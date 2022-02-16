
% 2022-02-16 demo code for dLight analysis 
% written by Jeong Oen Lee,  NIAAA / NIH 
% laboratory for integrative neuroscience (LIN) with Dr.David Lovinger
% Cocaine injection experiment

% photometry system :  Becker & Hickl HPM-100-40

%% load raw photometry data 

clc; close all; clear all
load('DLS_coc.mat');

% raw data has arrays of time (75000 points) and intensity (75000 points)

figure(1); subplot(1,3,1); plot(time,intensity,'k'); hold on;
xlabel ('time(min)');
ylabel ('dF/F ');
text(10,-1,'cocaine injection at 10min')
title (' dLight measurement' )
sampling = 20; % sampling rate (unit Hz)

%% noise reduction with moving average  
%  B = smoothdata(A) returns a moving average of the elements of a vector using a fixed window length that is determined heuristically. 
filtered= smoothdata(intensity,'movmedian',10);
figure(1); subplot(1,3,1);hold on; plot(time,filtered,'r');
ylim([-2 35]);

 %% peak detection ( 5min range before injection)
 clc;
 signal=filtered;

s_wdw=2; %starting time  at 2min
t_wdw=5; %time window 5min 
range = [sampling*60*s_wdw+1: sampling*60*(s_wdw+t_wdw)] ;
partial_time = time(range)';
partial_dLight = signal(range);
raw = signal(range);
figure(1); subplot(1,3,2);plot(partial_time,partial_dLight,'k');


threshold=max(partial_dLight)*0.5;  % threshold limit is 50% of max intensity
prom=3;                             % prominence of peak 

[pks1,locs]=findpeaks(partial_dLight ,'MinPeakHeight',threshold,'MinPeakProminence',prom);

figure(1);subplot(1,3,2); hold on;
plot (partial_time(locs), pks1,'ro');


length(pks1)
num=length(locs);
title(['detected peaks:' num2str(num)]);
xlabel ('time(min)');
ylabel ('dF/F ');
ylim([-5 25]);
xlim([2 7]);
 %% peak detection ( 5min range after injection)
 clc;
signal=filtered;

s_wdw=30; %starting time at 20 min 
t_wdw=5;  %time window 5min 
range = [sampling*60*s_wdw+1: sampling*60*(s_wdw+t_wdw)] ;
partial_time = time(range)';
partial_dLight = signal(range);
raw = signal(range);
figure(1); subplot(1,3,3);plot(partial_time,partial_dLight,'k');


threshold=max(partial_dLight)*0.5;  % threshold limit is 50% of max intensity
prom=3;                             % prominence of peak 

[pks1,locs]=findpeaks(partial_dLight ,'MinPeakHeight',threshold,'MinPeakProminence',prom);

figure(1); subplot(1,3,3);hold on;
plot (partial_time(locs), pks1,'ro');

length(pks1)
num=length(locs);
title(['detected peaks:' num2str(num)]);
xlabel ('time(min)');
ylabel ('dF/F ');
ylim([5 35]);
xlim([30 35]);
%% figure size adjustment 
    x=200;
    y=200;
    width=800;
    height=200;
    set(figure(1), 'Position', [x y width height])