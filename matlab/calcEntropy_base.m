
function [resEntropy] = calcEntropy_base(resData)
    currData = resData;
    %begin control entropy calculation
    
    %set the window size for control entropy calc
    w_length = 750;
    
    %preallocate space to store the result of each 750 data point window
    window_entropies = zeros(length(currData) - w_length+1,1);
    
    %for each window of data
    for a=1:length(currData) - (w_length+1)
        
        %grab the current window of 750 datapoints
        this_window = currData(a:a+w_length-1);
        
        %calculate the sample entropy of the window
        
        % Optional Parameters are:
        % dn
        %       1x1 double. Sets the scale increment to dn (1-40; default: 1).
        % dm
        %       1x1 double. Sets the m increment to dm (1-10; default: 1).
        % dr
        %       1x1 double. Sets the scale increment to dr (>0; default: 0.05).
        % N
        %       1x1 integer. Stop the analysis with row N.
        %       By default, analysis ends at row 39999, or at the end of the data set if there are fewer rows.
        % N0
        %       1x1 integer. Begin the analysis with row N0.
        %       By default, analysis begins with row 1.
        % minM
        %       1x1 integer betwee 1-10. Set the minimum pattern length for SampEn to minN (1-10; default: 2).
        % maxM
        %        1x1 integer betwee 1-10. Set the maximum m to maxM (1-10; default: 2).
        % maxScale
        %        1x1 integer betwee 1-40. Set the maximum scale for coarse-graining to maxScale (1-40; default: 20).
        % minR
        %        1x1 double >0. Set the minimum similarity criterion for SampEn to minR (>0; default: 0.15).
        % maxR
        %        1x1 double > 0. Set the maximum m to maxR (>0; default: 0.15).
        % msentropy(x,dn,dm,dr,N,N0,minM,maxM,maxScale,minR,maxR)
        window_entropies(a) = msentropy(this_window,[],[],[],[],[],[],[],1,[],[]);
        
        %print every 1000 iterations to confirm things are running.
        if ~mod(a,10000)
            fprintf("Iterating: %d", a);
        end
        
    end
    %windows = window_entropies;
    resEntropy = mean(window_entropies);
       
end    
    %then take averages of the pre and post window entropies.