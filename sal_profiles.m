info = ncinfo('salt_month.cdf');
for i = 1:length(info.Variables)
    disp(info.Variables(i).Name);
end

%% now reading Variable values
X = ncread('salt_month.cdf','X');
Y = ncread('salt_month.cdf','Y');
Z = ncread('salt_month.cdf','Z');
sal = ncread('salt_month.cdf','salinity');

%% Removing the land areas
sal(sal < -50) = nan;
% contourf(sal(:,:,1,4)')

%% Plott Salinity Profiles 

% Your data extraction
sal_slice1 = squeeze(sal(150, 20, :, 4));
sal_slice2 = squeeze(sal(150, 83, :, 4));
sal_slice3 = squeeze(sal(150, 146, :, 4));

% Create a new figure
figure;

% Your data
depth = (1:length(sal_slice1)).'; % Replace with actual depth values if available

% Plot with switched axes
h = plot([sal_slice1, sal_slice2, sal_slice3], depth, "LineWidth",2);
title('Salility Profiles for X=150 & T=4');
legend('Y=20','Y=83','Y=146')

% Reverse the y-axis direction
set(gca, 'YDir', 'reverse');

% Move the y-axis to the left (it is already there by default)
set(gca, 'YAxisLocation', 'left');

% Move the x-axis to the top
set(gca, 'XAxisLocation', 'top');

% Set the labels
ylabel('Depth (m)');
xlabel('Salinity (%)');

% Optionally, set the tick direction outwards
set(gca, 'TickDir', 'out');
grid("on");