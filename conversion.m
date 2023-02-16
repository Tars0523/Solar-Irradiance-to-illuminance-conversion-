
%% visible light components extraction

cnt = 0 ;
for i = 2:length_density
    if(wavelength(i)>=380*10^-9 && wavelength(i)<=760*10^-9)
        cnt = cnt + 1;
        E_visble(cnt) = E(i); % visible light irradiance
        V_visible(cnt) = V(i); % visible light spectral luminous efficiency values
        W_visible(cnt) = wavelength(i); % visible light wave length
    end
end

%% intregate 

dQ = 683*V_visible'.*E_visble'; % [W/m^2/m] -> [lum/m^2/m] conversion 
delta_lambda = 2500/(length_density-1); % delta of lamba used in integration [m]
Q = sum(dQ*delta_lambda*10^(-9)); % integration
alpha = 6.96^2*10^16/1.5^2/10^22; % distance between Sun and Earth = R_sun^2/d^2 = 6.96*10^16/1.5/10^22

%% Albedo 

Lum_min = Q*alpha*0.1; % min albedo 0.1 -> 12.475 x 10^3 [lx]
Lum_max = Q*alpha*0.9; % max albedo 0.9 -> 112.28 x 10^3 [lx]
Lum_mean = Q*alpha*0.367; % mean albedo 0.37 -> 45.84 x 10^3 [lx]


%% 500km Luminance and Illuminance
R_earth = 6.37*10^6;

luminous_flux_min = 2*pi*R_earth^2*Lum_min;
luminous_flux_max = 2*pi*R_earth^2*Lum_max;
luminous_flux_mean = 2*pi*R_earth^2*Lum_mean;

cd_min =  luminous_flux_min/2/pi ;
cd_max = luminous_flux_max/2/pi ;
cd_mean = luminous_flux_mean/2/pi ;

cd_min_m_square = cd_min/2/pi/(R_earth+500*10^(3))^2 ;
cd_max_m_square = cd_max/2/pi/(R_earth+500*10^(3))^2 ;
cd_mean_m_square = cd_mean/2/pi/(R_earth+500*10^(3))^2 ;



%% Figure

fig1 = figure;
fig2 = figure;
fig3 = figure;
fig4 = figure;

figure(fig1);
plot(wavelength,E);
title("irradiance spectrum of solar");
xlabel("wavelength [nm]");
ylabel("W/m^2/m");
grid on;
figure(fig2);
plot(W_visible,E_visble);
title("irradiance spectrum of solar")
xlabel("wavelength [m]");
ylabel("W/m^2/m");
grid on;
figure(fig3);
plot(W_visible,V_visible);
title("relative spectral density function");
xlabel("wavelength [m]");
ylabel("relative spectral density");
grid on;
figure(fig4);
plot(W_visible,dQ);
title("illuminance spectrum of solar");
xlabel("wavlength[m]");
ylabel("lm/m^2/m");
grid on;




















