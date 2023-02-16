
%% 
z = wavelength*10^9/555 - 1; % visible light normilization 
V = exp(-88.9*z.^2 + 112.95*z.^3); % relative spectral density function

