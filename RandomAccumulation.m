% Sky Hoffert
% August 22, 2019
% Random accumulation.

clear,clc

nSamples = 1000;

% Trinary mode (up, down, flat)
oddsZero = 10;
oddsPositive = 1;
oddsNegative = 1;
oddsTotal = oddsZero + oddsPositive + oddsNegative;

values = zeros(nSamples);
cumulative = 0;

for i = 1:1:nSamples
    v = oddsTotal * rand;
    if v < oddsPositive
        cumulative = cumulative + 1;
    elseif v < oddsPositive + oddsNegative
        cumulative = cumulative - 1;
    end
    values(i) = cumulative;
end

subplot(2,1,1);
plot(values);

% Floating mode
factor = 0.1;

values = zeros(nSamples);
cumulative = 0;

for i = 1:1:nSamples
    cumulative = cumulative + factor * randn;
    values(i) = cumulative;
end

subplot(2,1,2);
plot(values);
