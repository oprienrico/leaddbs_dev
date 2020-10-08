%this script is called at the opening of lead.m method
%here you can add specific instructions to execute at each lead.m initialization

%examples of variables available at this point:
% -hObject
% -earoot

%by default this package is unneeded
if false
    if isunix()
        % Include this line if libstdc++.so.6 is needed.
        % However it is preferrable to fix it at system level. 
        % Install the matlab-support package and choose to use the system libraries for gcc.
        addpath(fullfile(earoot,'ext_libs\support\unix'));
    end
else
    rmpath(fullfile(earoot,'ext_libs\support\unix'));
end