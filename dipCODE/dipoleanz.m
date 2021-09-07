classdef dipoleanz
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties 
    end
    
    methods 
        

        function peaks = ADDVARS_kern_peaks(obj,kern_array)
            
            num_units = numel(kern_array);
            peaks = zeros(num_units,2);
            for i = 1:numel(kern_array)
                kern = kern_array{i};
                [ii, jj] = get_kern_peak(kern);  
                peaks(i,1) = ii;
                peaks(i,2) = jj;
            end
            


%             dydxOn  =  offMax - onCom;
%             dipest  = atan2d(dydxOn(:,2), dydxOn(:,1)) + 270;
%             dipest(dipest>180) = dipest(dipest>180) - 180;    
%             dipest(dipest>180) = dipest(dipest>180) - 180;    


%             % For future calculation
%             statm.x0_diff           = nan; 
%             statm.y0_diff           = nan;    
%             statm.kern_diff         = nan(size(statm.kern_bright));
  

            
            function [ii, jj] = get_kern_peak(kern)
                [ii,jj] = find(kern == max(kern(:))); 
                if isempty(ii)
                    ii = nan;
                end
                if isempty(jj)
                    jj = nan;
                end
                
                if numel(jj) == 2
                    ii = ii(2);
                    jj = jj(2);
                end
                
                
            end
    
            
        end
        
        
        function kern_diff = ADDVARS_kern_diff(obj,kern_A, kern_B)
            
            nrm = @(k) [k - min(k(:))] / [  max(k(:)) - min(k(:)) ];
            
            
            k_nrows = size(kern_A{1},1);
            k_ncols = size(kern_A{1},2);
            filt_nrows = round(.05 * k_nrows);
            filt_ncols = round(.05 * k_ncols) ;    
            
            gausskern = fspecial('gauss',filt_nrows,filt_ncols);

            num_kern_pairs = numel(kern_A);
            kern_diff = cell(num_kern_pairs,1);
            
            for i = 1:num_kern_pairs
               
                kA= kern_A{i};
                kB= kern_B{i};
                
%     
%                 kA  =   filter2(gausskern,kern_A{i},'same');
%                 kB  =   filter2(gausskern,kern_B{i},'same');
%                 
                
                kern_diff{i} = nrm(kA) - nrm(kB);
                
                
            end
            
            
            
        end
        
        
        function fftK = ADDVARS_kern_fft(obj,kern_array)

            
            fftK = cell(numel(kern_array),1);
            for i = 1:numel(kern_array)
                K = kern_array{i};
                K       = K-mean(K(:));
                Kf      = filter2(fspecial('gauss',11,.75),fftshift(abs(fft2(K))),'same');
                ctr     = size(Kf)/2+1;     
                Kf      = Kf(ctr(1)-16:ctr(1)+16,ctr(2)-16:ctr(2)+16);
                
                fftK{i}    = Kf + rot90(Kf,2);  
            end
            
        
  

        end

    end
end

