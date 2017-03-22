function ea_methods(options,parsestr,refs)
% function that dumps a methods text to patient directory
% options can either be a leadsuite options struct or a string with the
% patient directory.
if ~isempty(options)
    if ~isstruct(options)
        options=ea_getptopts(options); % direct supply of directory string, options in brackets will be just a string with the directory in this case.
    end
end

directory=[options.root,options.patientname,filesep];

h=dbstack;
try
    callingfunction=h(2).name;
catch
    callingfunction='base';
end

expstr='\n\n';
expstr=[expstr,[datestr(datetime('now')),': ',callingfunction,'\n','--------------------------\n',...
    parsestr]];

if exist('refs','var') % add refs
    expstr=[expstr,'\n\nReferences:\n','--------------------------\n'];
    
    for r=1:length(refs)
        expstr=[expstr,[num2str(r),') ',refs{r},'\n']];
    end
end

expstr=[expstr,'\n\n***'];
if options.prefs.methods.show
    ea_methodsdisp({expstr});
else
    fprintf(expstr);
end

if exist('directory','var')
    metfile=fopen([directory,'ea_methods.txt'],'a');
    
    fprintf(metfile,expstr);
    fclose(metfile);
end

