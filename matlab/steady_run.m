function [start,term] = steady_run(dat,samp, cutoff)
%signal of interest - recommended you use a vertical axis (y) signal
sig = dat;
abs_sig = abs(sig);

%define cut-off frequency
freq = cutoff;

%filter the data to simplify the analysis
[b,a] = butter(4,freq/(samp/2),'low');
filt_sig = filtfilt(b,a,abs_sig);

%calculate the difference between consectuve points in the filtered data
diff_sig = diff(filt_sig);

%start and terminus of steady state run defined by the max and min of the
%difference vector
half = length(filt_sig)/2;
[~, start] = max(diff_sig(1:int32(half)));
[~, term] = min(diff_sig);
end