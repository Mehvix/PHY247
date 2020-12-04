function [fitresult, gof] = createFit(y, f)
%CREATEFIT(Y,F)
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
%       p1 =       2.999  (2.671, 3.326)
%       p2 =      0.1963  (0.1701, 0.2225) 

%% Fit: 'Q2 Spring1'.
[xData, yData] = prepareCurveData( y, f );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
figure( 'Name', 'Q2 Spring1' );
h = plot( fitresult, xData, yData );
legend( h, 'F vs. y', 'Q2 Spring1 Fit', 'Location', 'NorthWest', 'Interpreter', 'none' );
% Label axes
xlabel( 'Displacement (cm)' , 'Interpreter', 'none' );
ylabel( 'Force (N)', 'Interpreter', 'none' );
title('Spring 1 Graph');
grid on

  
