function [V] = readVoltif(varargin)
%Read tif image stack (3D)
%
%   [V] = readVoltif(fname)
%   [V] = readVoltif(fname,nn)
%   --------------------------
%   Inputs:
%       > fname : file name
%       >    nn : (optional) number of slices to be read
%   Outputs:
%       >     V: image matrix
%
%   Yang CHEN 2018.02.01
%

% input setting
narginchk(1,2);
fname = varargin{1};
info = imfinfo(fname);
if nargin==1
    nsl = numel(info);
elseif nargin==2
    nsl = varargin{2};
end

% read the tiff stack 
fprintf(['reading the tiff stack: ',fname,'\n'])
A = imread(fname, 1);
V = zeros([size(A),nsl],class(A));
for i = 1:nsl
    V(:,:,i) = imread(fname,i);
    fprintf([num2str(i),',']);
end
fprintf(['\n reading completed.\n'])

end


