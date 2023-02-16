clear;
clc;
close all;
%% Parameter

h = 6.62607015*10^(-34) ; % plank constant [m^2 kg / sec]
k = 1.3806497*10^(-23) ; % boltzman constant [m^2 kg / sec^2 / K]
e = 1 ; % Emissivity [black body's emissivity, assuming perfect emitter] 
c = 299792458; % light speed [m/s]
T = 5780 ; % solar temperature [K]  
%% SOLAR IRRADIANCE FUNCTION

length_density = 10000000; % accuracy of integration

wavelength = linspace(0,2500,length_density)*10^(-9); % wavelenght in unit [nm]->[m] 
E = zeros(length_density,1); % irradiance spectrum of solar

%% Plank's Theroem 

for i=2:length_density 
    first = 2*pi*h*c^2/(wavelength(i)^5);
    second = 1/( exp ( h*c/( wavelength(i)*k*T ) ) -1 );
    E(i) = first*second;
end

