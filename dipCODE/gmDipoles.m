clear; clc;
cd c:\2pdata\gmAnalyze\
uiopen('load')  % load gmProfiles_v2

%% THis script estimates preferred orienation of neurons from the
% orientation of the dipole formed by their on and off subfields. Also
% estimated is the "veridical" orienation preference of cells from the
% hartley stimulus. A table, D, is generated with the following variables.
%
% cell's experiment id, cell's id in sparse noise experiment and in hartley
% experiment, cell's offmap, on map, and tuning kernel, cells off subfield
% center of mass (ie the max pixel), ass well as for the on subfield and
% tuning kernel, the kurtosis of the distribution of Off and on maps and
% kernel, the estimated diple preferred oriatntiaon and the tuning kernels
% estimate.



%%
clearvars -except E
clc;

close all;

D = {};
for e = 1:length(E)
EX = E(e);
if E(e).Sparse.mag == 2   
    
    offmaps     = E(e).Sparse.profOff.offProf_Raw;  
	onmaps      = E(e).Sparse.profOn.onProf_Raw; 
     
    offMax = zeros(size(offmaps,1),2);
    onCom = zeros(size(offmaps,1),2);
    for i = 1:size(offmaps,1)
        [~, mi] = max(offmaps{i}(:));
        [offMax(i,2),offMax(i,1)] = ind2sub([270 480],mi);        
        [~, mi] = max(onmaps{i}(:));
        [onCom(i,2),onCom(i,1)] = ind2sub([270 480],mi);      
    end
    
    dydxOn  =  offMax - onCom;
    dipest  = atan2d(dydxOn(:,2), dydxOn(:,1)) + 270;
    dipest(dipest>180) = dipest(dipest>180) - 180;    
    dipest(dipest>180) = dipest(dipest>180) - 180;    
    
    
    tuneker      = E(e).Hartley.prof.tProf_Raw; 
    x       = sub2ind([25 25], 13,13); % linear index of origin
    tuneCom   = zeros(size(tuneker,1),2);
    for i = 1:size(tuneker,1)
        [~,si] = sort(tuneker{i}(:));
        xy = si(end);
        if si(end) == x
            xy = si(end-1);
        end
        [tuneCom(i,2),tuneCom(i,1)] = ind2sub([25 25],xy); 
    end
    
    dydxTn    =  [13 13] - tuneCom;
    hartest = atan2d(dydxTn(:,2), dydxTn(:,1)) + 270;
    hartest(hartest>180) = hartest(hartest>180) - 180;
    hartest(hartest>180) = hartest(hartest>180) - 180;
    
    
    % filter | choose only matching cells
    if isempty(E(e).match) % skip if no matching cells
        continue; 
    else; match = E(e).match.Variables;
    end
    idlistHartley = match(:,1);
    idlistSparse = match(:,2);
        
    dipest = dipest(idlistSparse); 
    hartest = hartest(idlistHartley);          

    for i = 1:size(idlistSparse,1) 
        
        c_s = idlistSparse(i);
        c_od = dipest(i);       % dipole estimate of cell 
        
        c_offmap = offmaps{c_s};
        c_offcom = offMax(c_s,:);
        
        c_onmap  = onmaps{c_s};
        c_oncom  = onCom(c_s,:);
        
        c_h      = idlistHartley(i);       
        c_ot      = hartest(i);      % true tuning  of cell         
        c_tnkern  = tuneker{c_h};
        c_tncom   = tuneCom(c_h,:);
        
        c_offsig    = kurtosis(c_offmap(:));
        c_onsig     = kurtosis(c_onmap(:));
        c_kernelsig  = kurtosis(c_tnkern(:));
       
        c_err = c_ot-c_od;
        
        D =  [D; cell2table({e, c_s, c_h,...
                {c_offmap}, c_onmap, c_tnkern,...
                c_offcom, c_oncom, c_tncom,...
                c_offsig, c_onsig, c_kernelsig,...
                c_od, c_ot, c_err} )];  
    end
  
end


end

varids = {'expid', 'sparseid','hartleyid',...
            'offmap',   'onmap',    'tuningkernel',...
            'offcom',   'oncom',    'kernelcom',...
            'offkurt',  'onkurt',   'kernelkurt',...
            'dipoleori', 'kernelori', 'esterror'};



D.Properties.VariableNames = varids;



%%
figure('units','normalized','outerposition',[0 0 1 1])
for i = 1:size(D,1)
   
%   if D.offkurt(i) < 0 ||  D.onkurt(i) < 0 || D.kernelkurt(i) < 0
%     continue
%   end
    
if any(i == [12 18 22 48 51 56 58 63 64 67 68 79 90 106 109 111 113 116 119 123 124 156])

    
   subplot(2,3,1)
        hold on
        imagesc(D.offmap{i}, [min(D.offmap{i}(:)) max(D.offmap{i}(:))])
        plot(D.offcom(i,1),D.offcom(i,2), 'bo')        
        
        title(sprintf('Fig1. Off Map | kurt = %.04f',D.offkurt(i)))
        axis equal tight
        
        hold off
   subplot(2,3,2)
        hold on
        imagesc(D.onmap{i}, [min(D.onmap{i}(:)) max(D.onmap{i}(:))])
        plot(D.oncom(i,1),D.oncom(i,2), 'ro')
        
        title(sprintf('Fig2. On Map | kurt = %.04f',D.onkurt(i)))
        axis equal tight
        hold off
        
    h = subplot(2,3,3);
        hold on;
        bon = reshape(zscore(D.onmap{i}(:))>3, [270 480]);
        boff = reshape(zscore(D.offmap{i}(:))>3, [270 480]);
        imagesc(bon - boff, [min(bon(:) - boff(:)),max(bon(:) - boff(:))]  )
        plot(D.oncom(i,1),D.oncom(i,2), 'ro')
        plot(D.offcom(i,1),D.offcom(i,2), 'bo')
        line([D.oncom(i,1) D.offcom(i,1)],[D.oncom(i,2) D.offcom(i,2)], 'color', 'k')
        text((D.oncom(i,1)+D.offcom(i,1))./2,(D.oncom(i,2)+D.offcom(i,2))./2,sprintf('dipole Ori: %.02f',  D.dipoleori(i) ))

        title('Fig3.(zOn > 3std) - (zOff > 3std)')
        axis equal tight
        h.Position  =  [h.Position(1)-.03, h.Position(2)-.11, .2134+.12, .3412+.21];

        
        hold off
        
     subplot(2,3,5)
        hold on
        imagesc(D.tuningkernel{i},[min(D.tuningkernel{i}(:)) max(D.tuningkernel{i}(:))])
        plot([13 D.kernelcom(i,1)],[13 D.kernelcom(i,2)], 'go')   
        line([13 D.kernelcom(i,1)],[13 D.kernelcom(i,2)], 'color', 'k')
        text((D.kernelcom(i,1)+D.kernelcom(i,1))./2,(D.kernelcom(i,2)+D.kernelcom(i,2))./2,sprintf('Kernel Ori: %.02f',  D.kernelori(i) ))
             
        title(sprintf('Fig4. Tuning Kernel | kurt = %.04f',D.kernelkurt(i)))
        axis equal tight
        
        hold off
        
    subplot(2,3,6)
    
    thonoff = deg2rad(linspace(D.dipoleori(i),D.dipoleori(i)+360,100));
    thkernel = deg2rad(linspace(D.kernelori(i),D.kernelori(i)+360,100));
    
    r = [1 zeros(1,99)];
    
    polar(thonoff,r, 'r'); hold on
    polar(thkernel,r, 'k'); hold on
    text(1,1, sprintf('Error: %.02f', D.esterror(i) ), 'color', 'm')
    
    title(['Fig5. Cell No. ', num2str(i)])    
    axis off
    legend({'Dipole', 'Tuning Kernel' }, 'location', 'southeast')
    
%     pause;
    saveas(gcf,['C:\2pdata\gmAnalyze\100 Dipole Orientation Estimates\cell ', num2str(i),'.png'])
    
    clf;
    

end
    
end














%% Tranforming angles to 0 - 180 degree range
clf
nangles = 100;
orilist = linspace(0,359,nangles);

cxcy = [0 0];

oxoy = [cosd(orilist)' sind(orilist)'];
dxdy = cxcy - oxoy;

subplot(2,1,1)

colorlist = rand(numel(orilist),3);
for i = 1:numel(orilist)
plot(cxcy(1,1) + oxoy(i,1), cxcy(1,2) + oxoy(i,2), '.', 'markersize', 10, 'color', colorlist(i,:))
hold on
end
axis tight equal


subplot(2,1,2)
o = atan2d(dxdy(:,2),dxdy(:,1)) + 270;
o(o>180) = o(o>180) - 180; 
o(o>180) = o(o>180) - 180; 

for i = 1:numel(orilist)
plot(orilist(i), o(i), '.', 'color', colorlist(i,:))
hold on

end
axis tight equal














