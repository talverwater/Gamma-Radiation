%% import data block
names = {...
    'Cs-137_14min',...
    'background_1h_20m',...
    'Eu-152_12m',...
    'Na-22_16m'...
    };
dataArray = zeros(length(names),8192);
for ind=1:length(names)
    dataArray(ind,:) = importrawdata(char(names(ind)));
end
clear ind

%% finding chanel energy linear fit
Na_22_picks_chanel = [6257,2500];
Na_22_picks_energies_books = [1.274,0.511];

% coef values of linear fit
coefavl = polyfit(Na_22_picks_chanel,Na_22_picks_energies_books,1);
% converting chanel to energy by the linear fit we foud
x = 1:size(dataArray,2);
Ene_MeV = coefavl(1)*x+coefavl(2);
plot(Ene_MeV,dataArray(2,:));shg;
