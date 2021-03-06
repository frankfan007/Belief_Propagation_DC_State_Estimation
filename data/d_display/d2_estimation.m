 function [] = d2_estimation(bp, wls, stop)

 
 
%-------------------------------Display Data-------------------------------
 bp.pos_time = toc;
 
 m = bp.mean;
 A = [(1:bp.Nvar)' (m * 180/pi) wls.Tdeg (m - wls.T) * 180/pi];
%--------------------------------------------------------------------------


%%
 disp(' ')
 disp(' ')
 disp(' ....................:::::::::::::::::::::::::::   BP State Estimation   :::::::::::::::::::::::::::....................');
 disp(' ')
 fprintf('\tMethod: BP-based DC State Estimation\n');
 fprintf(['\tDate: ', datestr(now, 'dd.mm.yyyy HH:MM:SS \n')])
 fprintf('\tStopping condition for iterative process: %s\n ', num2str(stop))
 fprintf ('\tNumber of iterations: %d\n', bp.k)
 disp(' ')
 fprintf ('\tNumber of Variable Nodes: %d\n', bp.Nvar)
 fprintf ('\tNumber of Factor Nodes: %d\n', bp.Nfac)
 fprintf ('\tNumber of Links: %d\n', bp.Nmsg + bp.Ndir)
 disp(' ')
 fprintf('\tWeighted Least Squares: %2.5f seconds\n', wls.time)
 fprintf('\tPreprocessing: %2.5f seconds\n', bp.pre_time)
 fprintf('\tBelief Propagation Iterations: %2.5f seconds\n', bp.iter_time)
 fprintf('\tPostprocessing: %2.5f seconds\n', bp.pos_time)
 disp(' ')

 disp('  __________________________________________________________________') 
 disp('      Bus       Voltage Angle BP and WLS      Difference BP - WLS')
 disp('                        Va [deg]                     [deg]       ')
 disp('  ------------------------------------------------------------------') 
 fprintf('%8.f %16.4f %11.4f %21.2e\n', A') 
 disp('  __________________________________________________________________')
 