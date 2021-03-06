function [fitresult, gof] = createFit2(x, N, err)
%CREATEFIT2(X,N,ERR)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: N
%      Weights : err
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 07-Oct-2017 13:26:12


%% Fit: 'untitled fit 1'.
[xData, yData, weights] = prepareCurveData( x, N, err );

% Set up fittype and options.
ft = fittype( 'a1+a2*x +a3*x^2 +c1*exp(-(x-c2)^2/(2*s^2))', 'independent', 'x', 'dependent', 'y' );
excludedPoints = (xData < 70) | (xData > 110);
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-Inf -Inf -Inf -Inf 90 -Inf];
opts.StartPoint = [0.521135830804001 0.231594386708524 0.488897743920167 0.62406008817369 0.679135540865748 0.395515215668593];
opts.Upper = [Inf Inf Inf Inf 95 Inf];
opts.Weights = weights;
opts.Exclude = excludedPoints;

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Create a figure for the plots.
figure( 'Name', 'Mass fit Z' );

% Plot fit with data.
subplot( 2, 1, 1 );
h = plot( fitresult, xData, yData, excludedPoints );
legend( h, 'Nevents vs. mass with err', 'Excluded Nevents vs. mass with err', 'Mass fit Z', 'Location', 'NorthEast' );
% Label axes
xlabel x
ylabel N
grid on

% Plot residuals.
subplot( 2, 1, 2 );
h = plot( fitresult, xData, yData, excludedPoints, 'residuals' );
legend( h, 'Mass fit Z - residuals', 'Excluded Nevents vs. mass with err', 'Zero Line', 'Location', 'NorthEast' );
% Label axes
xlabel 'Lepton pair mass (GeV)'
ylabel 'Nevents per mass bin'
grid on


