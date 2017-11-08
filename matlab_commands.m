%% import data block
names = {...
    'Co-60_25min.Spe',...
    'cs137.Spe',...
    'Eu152_15min.Spe',...
    'Na22_17min.Spe'...
    'Ra-226_10min.Spe'...
    };
dataArray = zeros(length(names),8192);
Path='C:\Users\tsilv\Desktop\studies\year 3\lab\gamma\left sys-20171108T135006Z-001\left sys\'
for ind=1:length(names)
    dataArray(ind,:) = importrawdata(strcat(Path,char(names(ind))));
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
