function [fitresult, gof] = createFit2(y, f)
%CREATEFIT2(Y,F)
%  Create a fit.
%
%  Data for 'Q2 Spring1' fit:
%      X Input : y
%      Y Output: f
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%     Linear model Poly1:
%     ans(x) = p1*x + p2
%     Coefficients (with 95% confidence bounds):
%       p1 =       3.471  (3.244, 3.698)
%       p2 =     -0.0816  (-0.09192, -0.07128)

%% Fit: 'Q2 Spring2'.
[xData, yData] = prepareCurveData( y, f );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Q2 Spring2' );
h = plot( fitresult, xData, yData );
legend( h, 'F vs. y', 'Q2 Spring1 Fit', 'Location', 'NorthWest', 'Interpreter', 'none' );
% Label axes
xlabel( 'Displacement (cm)' , 'Interpreter', 'none' );
ylabel( 'Force (N)', 'Interpreter', 'none' );
title('Spring 2 Graph');
grid on


