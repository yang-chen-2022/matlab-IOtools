function saveImRAW(fnameS,V,varargin)
%save image to raw data
%
%   saveImRAW(fnameS,V)
%   saveImRAW(fnameS,V,'noinfo')
%   ----------------------------
%
%   Inputs:
%       - fnameS : file name
%       -      V : image to be saved
%
% Yang CHEN 2019.02.03
    

fprintf(['saving the image to ',fnameS,'\n']);

% file information
if nargin==2
    volinfo = ['width = ',num2str(size(V,1)),'    '...
       'height = ',num2str(size(V,2)), '    '...
       'number of slices = ',num2str(size(V,3)), '    ',...
       class(V)];
    fnameSinfo = [fnameS,'info'];
    fid = fopen(fnameSinfo,'w');
    fprintf(fid,'%s',volinfo);
    fclose(fid);
else
    if strcmpi(varargin{1},'noinfo')
        fprintf('no volume information will be printed')
    else
        volinfo = ['width = ',num2str(size(V,1)),'    '...
           'height = ',num2str(size(V,2)), '    '...
           'number of slices = ',num2str(size(V,3)), '    ',...
           class(V)];
        fnameSinfo = [fnameS,'info'];
        fid = fopen(fnameSinfo,'w');
        fprintf(fid,'%s',volinfo);
        fclose(fid);
    end
end

% file saving
fid = fopen(fnameS,'w');
fwrite(fid,V(:),class(V));
fclose(fid);

fprintf('saving complete\n');
