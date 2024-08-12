info = ncinfo('temp_month.cdf');
for i = 1:length(info.Variables)
    disp(info.Variables(i).Name);
end

%% now reading Variable values
XX = ncread('temp_month.cdf','X');
YY = ncread('temp_month.cdf','Y');
ZZ = ncread('temp_month.cdf','Z');
TT = ncread('temp_month.cdf','T');
temp = ncread('temp_month.cdf','temperature');

% contourf(temp(:,:,1,4)')
% hold on
% temp_val = temp(247,119,:,:)
%% Removing the land areas
temp(temp < -50) = nan;

%% Plot Temperature profiles

% Your data extraction
temp_slice1 = squeeze(temp(150, 20, :, 4));
temp_slice2 = squeeze(temp(150, 83, :, 4));
temp_slice3 = squeeze(temp(150, 146, :, 4));

% Create a new figure
figure;

% Your data
depth = (1:length(temp_slice1)).'; % Replace with actual depth values if available

% Plot with switched axes
h = plot([temp_slice1, temp_slice2, temp_slice3], depth, "LineWidth",2);
title('Temperature Profiles for X=150 & T=4');
legend('Y=20','Y=83','Y=146')

% Reverse the y-axis direction
set(gca, 'YDir', 'reverse');

% Move the y-axis to the left (it is already there by default)
set(gca, 'YAxisLocation', 'left');

% Move the x-axis to the top
set(gca, 'XAxisLocation', 'top');

% Set the labels
ylabel('Depth (m)');
xlabel('Temperature (°C)');

% Optionally, set the tick direction outwards
set(gca, 'TickDir', 'out');
grid("on");
