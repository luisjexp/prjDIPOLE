clear;
clc;
close all;
addpath /Users/luis/Box/prjV1TB/v1DATA/   
addpath /Users/luis/Box/prjV1TB/v1CODE/
cd /Users/luis/Box/prjDIPOLE/dipCODE


%% LOAD V1 UNIT DATA TABLE
clc;
v1          = v1anz;
df_units    = v1.get_roi_table;
df          = df_units.roi_stack;


%% ADD PROPERTIES TO TABLE
clearvars -except df_units

% Initialize

clc;
df  = df_units.roi_stack;
df = df(df.has_rf_on_kern & df.has_rf_off_kern,:);
dip = dipoleanz();

% Get Subregion Centere
RF_OFF_peaks_ij     = dip.ADDVARS_kern_peaks(df.offSubfield);
RF_ON_peaks_ij         = dip.ADDVARS_kern_peaks(df.onSubfield);
dx = RF_OFF_peaks_ij(:,2) - RF_ON_peaks_ij(:,2);
dy = RF_OFF_peaks_ij(:,1) - RF_ON_peaks_ij(:,1);

% Estimate ori preference from subregion peaks
RF_ONOFF_peak_angle    = atan2d(dy, dx);
RF_ONOFF_peak_angle(RF_ONOFF_peak_angle<0) = 180+RF_ONOFF_peak_angle(RF_ONOFF_peak_angle<0);

% Get Differenced Receptive field 
RF_diff      = dip.ADDVARS_kern_diff(df.onSubfield, df.offSubfield);


% Get Differenced FFT 
RF_diff_fft = dip.ADDVARS_kern_fft(RF_diff);

% Estimate ori preference from differenced FFT
fft_center = [17,17];
RF_diff_fft_peaks_ij    = dip.ADDVARS_kern_peaks(RF_diff_fft);
dx = 17 - RF_diff_fft_peaks_ij(:,2);
dy = 17 - RF_diff_fft_peaks_ij(:,1);

RF_diff_fft_peak_angle    = atan2d(dy, dx);
RF_diff_fft_peak_angle(RF_diff_fft_peak_angle<0) = 180+RF_diff_fft_peak_angle(RF_diff_fft_peak_angle<0);


% Get Ori Preference from tuning kernel
ori_values  = [0:10:170]';
TUN_peaks_ij   = dip.ADDVARS_kern_peaks(df.tuningKernel);
TUN_peak_angle = ori_values(TUN_peaks_ij(:,1));



% Generate Table
df = [df,...
    table(RF_OFF_peaks_ij),...
    table(RF_ON_peaks_ij),...
    table(RF_ONOFF_peak_angle),...    
    table(RF_diff),...
    table(RF_diff_fft),...
    table(RF_diff_fft_peaks_ij),...
    table(RF_diff_fft_peak_angle),...
    table(TUN_peak_angle)];


head(df(:,1:7))
head(df(:,8:end))

%% --------- VISUALIZE ---------
clc
close all
figure('WindowStyle', 'docked')
figure(gcf)


% FIGURE STRUCTURE
ax_nrws = 4;
ax_ncls = 2;



num_units = height(df);
for i = 1:num_units
    % ON SUBFIELD
    subplot(ax_nrws,ax_ncls,1); hold on; axis tight

    
    on_peaks    = df.RF_ON_peaks_ij(i,:);
    on_subfield = df.onSubfield{i};
    
    imagesc(on_subfield); 
    plot( on_peaks(2), on_peaks(1),...
        'Marker', 'o', 'MarkerSize', 20, 'MarkerEdgeColor', 'r')
    
    
    % OFF SUBFIELD
    subplot(ax_nrws,ax_ncls,3); hold on; axis tight
    
    off_subfield    = df.offSubfield{i};    
    off_peaks       = df.RF_OFF_peaks_ij(i,:);
    
    imagesc(off_subfield)  
    plot(off_peaks(2), off_peaks(1),...
        'Marker', 'o', 'MarkerSize', 20, 'MarkerEdgeColor', 'r')
    

    % DIFF RECEPTIVE FIELD MAP
    subplot(ax_nrws,ax_ncls,5); hold on; axis tight

    diff_subfield = df.RF_diff{i};
    imagesc(diff_subfield)
    plot(on_peaks(2), on_peaks(1),...
        'Marker', 'o', 'MarkerSize', 20, 'MarkerEdgeColor', 'r')
    plot(off_peaks(2), off_peaks(1),...
        'Marker', 'o', 'MarkerSize', 20, 'MarkerEdgeColor', 'r')    
    
    xab = [on_peaks(2), off_peaks(2)];
    yab = [on_peaks(1), off_peaks(1)];
    line(xab , yab, 'linewidth', 5, 'Color', 'm')
   
    theta_estimate =  df.RF_ONOFF_peak_angle(i);
    title(sprintf('angle : %f', theta_estimate) )
    
    
    % DIFF RECEPTIVE FIELD FFT
    subplot(ax_nrws,ax_ncls,6); hold on; axis tight
    
    imagesc(df.RF_diff_fft{i});
    plot(RF_diff_fft_peaks_ij(i,2), RF_diff_fft_peaks_ij(i,1),...
        'Marker', 'o', 'MarkerSize', 15, 'MarkerEdgeColor', 'r')      
    
    title(sprintf('angle : %f', df.RF_diff_fft_peak_angle(i)))
    
    
    % TUNING KERNEL
    subplot(ax_nrws,ax_ncls,7); hold on; axis tight
    imagesc(df.tuningKernel{i});
    title(sprintf('Angle : %d', df.TUN_peak_angle(i)))

    
    pause;
    
    
    
    
    
    
end














