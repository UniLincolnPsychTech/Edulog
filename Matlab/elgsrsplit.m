function data = elgsrsplit(data, sps)
close all

t = smooth([data.GSR], sps*2, 'moving'); % Use a moving smooth method with a span of 2 seconds to extract tonic signal
for n = 1:length(data) % For each data point...
    data(n).Tonic = t(n); % Replace data in tonic array with smoothed equivalent
    data(n).Phasic = data(n).GSR - t(n); % Replace data in phasic array with difference between tonic equivalent and original value (this is the phasic signal)
end

elplot(data, {'Tonic' 'Phasic'}, {});
