function [RMSECVs,initSel] = spMLREvaluation(X, y, m_min,m_max, varargin)
% SPMLREVALUATION: Evaluation of the candidate variable subsect that is obtained by 
%   successive projections (qrSP.m), based on MLR (multiple linear regression) 

% Input:
%       X: input spectral matrix (dimension N x K, N samples and K wavelengths)
%       y: measurements of response variable (as opposed to predicator X)
%       m_min: minimum number of wavelengths to select
%       m_max: maximum number of wavelengths to select
%       varargin: other potential options (see parsing below)

% Output:
%      RMSECVs: the full set of RMSECVs corresponding to the SEL candidate variable index matrix
%      init: initially selected subset of variables corresponding to minimum RMSECV
% Usage:
%     [RMSECVs,varOpt] = spREvaluation(SEL,1,min(size(SEL)),Xcal, ycal, 'MLR','KFold',10)

% See qrSP.m and qrProjections.m below for obtaining initial selection by QR factorization

% See also: https://doi.org/10.1093/forsci/fxab003
% YL, 07/26/2020


% Step 0. Argument check and parsing 
if nargin<5
    error('Not enough arguments')
end
if isempty(m_min)
    m_min = 1;
end
if isempty(m_max)
    m_max = min(size(X)) - 1;
end
     
% parsing
ip = inputParser;
ip.addOptional('LeaveOut',1,@(n) validateattributes(n, {'numeric'},{'integer','real','scalar'}));
ip.addOptional('KFold',10,@(n) validateattributes(n, {'numeric'},{'integer','real','scalar'}));
ip.addOptional('CVIter',1,@(n) validateattributes(n,{'numeric'},{'integer','real','scalar'}));
ip.parse(varargin{:});
res = ip.Results;
leaveout = res.LeaveOut; % leave-one-out cross validation (LOOCV)
kfold = res.KFold; % k-fold cross validation
cviter = res.CVIter; % itrations of k-fold cross validation (for robustness)


% Step 1: Successive Projections 
SEL = qrSP(X, m_max); % candidate selection matrix


% Step 2: MLR evaluation (a rate-limiting step)
h = waitbar(0,'Evaluation of candidate subset. Please wait...');
warning off MATLAB:singularMatrix
warning off MATLAB:nearlySingularMatrix

K = size(SEL,2);
RMSECVs = zeros(m_max,K);%set INF to all the entries 
minRMSECV = inf;
initSel = [];
loopStart = now;
for k = 1:K
    % compute cross validation errors for all candidate subsets
    fprintf(['\n Subset order: ',num2str(k),'\n']);
    
    for m = m_min:m_max
        var_sel = SEL(1:m,k);

        % root-mean-square error of cross validation (RMSECV)
        if ismember('KFold',string(varargin))
            RMSECV = cvMLR(X(:,var_sel),y,'KFold',kfold,'CVIter',cviter);
        else
            RMSECV = cvMLR(X(:,var_sel),y,'LeaveOut',leaveout);
        end
        RMSECVs(m,k) = RMSECV;
        
        % optimal (initial) selection is determined by the minimal RSMSECV
        if minRMSECV>RMSECV
            initSel = SEL(1:m,k);
            minRMSECV = RMSECV;
            % fprintf(['\n k=',num2str(k),' and m=',num2str(m),': minRMSECV DECREASED to ',num2str(minRMSECV),'\n']);
        end
        fprintf(['\n m=',num2str(m),': minRMSECV=',num2str(minRMSECV),'\n']);
    end
    
    loopEnd = loopStart + (now-loopStart)*K/k;
    waitbar(k/K,h,['Evaluation of variable subsets: ' datestr(loopEnd)]);
end
close(h);
% complete the Steps 1 & 2

warning on MATLAB:singularMatrix
warning on MATLAB:nearlySingularMatrix
disp('Evaluation of variable subsets DONE!')
end

%..........................................................................
function SEL = qrSP(X, m_max)
% QRSP: successive projections through QR decomposition for minimized
%       variable colinearity
%
% Input:
%   X: spectral matrix (autoscaling may be performed onto the data)
%   m_max: the maximum number of wavelengths to keep

% Output:
%   SEL: initial selection matrix based on successfive projections of inpput matrix 
%        for variable selection  based on qr factorization to minimize 
%        variable collinearity (https://doi.org/10.1016/j.chemolab.2007.12.004)

% Example: 
%           SEL = qrSP(X, min(size(X))-1, [])

% YL, 05/09/2020
 
% Reference: 
%   https://doi.org/10.1016/S0169-7439(01)00119-8
%   https://doi.org/10.1016/j.chemolab.2007.12.004 
%   https://doi.org/10.1016/j.chemolab.2012.05.014 

[N, K] = size(X);

% arguments check
if isempty(m_max)
    m_max = min(N-1,K); 
end 
if m_max > min(N-1,K)
    error('m_max is too large !');
end

% preprocessing
if autoscaling == 1
    normalization_factor = std(X);
else
    normalization_factor = ones(1,K);
end

% mean centering 
Xn = X;
for k = 1:K
    x = X(:,k);
    Xn(:,k) = (x - mean(x))/normalization_factor(k);
end

% projections started
h = waitbar(0,'Successive Projections. Please wait...');

loopStart = now;
SEL = zeros(m_max,K);
for k = 1:K
    SEL(:,k) = qrProjections(Xn,k,m_max);
    loopEnd = loopStart + (now-loopStart)*K/k;
    waitbar(k/K,h,['Successive Projections. ETC: ' datestr(loopEnd)]);
end
close(h);

fprintf('\n Successive Projections DONE!\n');
end

%..........................................................................
function chain = qrProjections(X,k,M)
% Projections based on QR factorization (similar to the GS othogonalization)

X_projected = X;
norms = sum(X_projected.^2);    % Square norm of each column vector
norm_max = max(norms); % Norm of the "largest" column vector

% Scales the kth column so that it becomes the "largest" column
X_projected(:,k) = X_projected(:,k)*2*norm_max/norms(k); % pivoting column

% A*P = Q*R (https://www.mathworks.com/help/symbolic/qr.html#d120e152496)
[~, ~, order] = qr(X_projected,0); %reduced QR factorization (Gram-Schmidt orthogonalization)
% A = QR, where Q is an orthogonal square matrix and R is an upper triangular matrix

chain = order(1:M)';
end

%..........................................................................
function [RMSECV, varargout] = cvMLR(XData,YData, varargin)
% CROSS VALIDATION of Multiple linear regression models
%   Usage: RMSECV = cvMLR(Xcal,ycal,'KFold',10,'CVIter',1);
% YL, 07/28/2020


% argument parsing
ip = inputParser;
ip.addOptional('LeaveOut',1,@(n) validateattributes(n, {'numeric'},{'integer','real','scalar'}));
ip.addOptional('KFold',10,@(n) validateattributes(n, {'numeric'},{'integer','real','scalar'}));
ip.addOptional('CVIter',1,@(n) validateattributes(n,{'numeric'},{'integer','real','scalar'}));
ip.parse(varargin{:});
res = ip.Results;
leaveout = res.LeaveOut;
kfold = res.KFold;
cviter = res.CVIter;

% cross validation
N = numel(YData);
RMSECVs = zeros(cviter,1);
for ii = 1:cviter
    if ismember('KFold',string(varargin))
        %fprintf('\n CVIter#%3d and Kfold=%3d\n',ii,kfold);
        cp = cvpartition(N,'KFold',kfold);
    else
        %fprintf('\n Leaveout=%3d\n',leaveout);
        cp = cvpartition(N,'KFold',round(N/leaveout));
    end
    
    [trIdx,teIdx] = kfoldPartitionIdx(cp);
    RES = YData;
    YcvPred = YData;
    YcvTrue = YData;
    for jj = 1:size(teIdx,2)
        [~, res, pred] = multipleLR(XData(trIdx(:,jj),:),YData(trIdx(:,jj),:),XData(teIdx(:,jj),:),YData(teIdx(:,jj),:));
        RES(teIdx(:,jj)) = res;
        YcvPred(teIdx(:,jj)) = pred;
        YcvTrue(teIdx(:,jj)) = YData(teIdx(:,jj));
    end
    RMSECV = sqrt(sum(RES.^2)/length(RES));
    RMSECVs(ii) = RMSECV;
end
RMSECV = mean(RMSECVs);

% MLR calibration 
[~, ycal_res,ycal_pred] = multipleLR(XData,YData);
varargout{1} = RMSECVs;
varargout{2} = sqrt(sum(ycal_res.^2)/length(ycal_res));
varargout{3} = ycal_pred;
varargout{4} = YcvPred;
varargout{5} = YcvTrue;
end

%..........................................................................
function [b,varargout] = multipleLR(Xcal, ycal, Xval, yval)
% see also: 
%         b = regress(y,[ones((length(y),1), X]);

% Alternatively:
%         mdl = fitlm(X,y)

% YL, 07/28/2020

Xcal_ones = [ones(length(ycal),1), Xcal];
b = Xcal_ones\ycal;
ycal_pred = Xcal_ones*b;
ycal_res = ycal-ycal_pred;
res = ycal_res;
ypred = ycal_pred;

if nargin==4
    yval_pred = [ones(length(yval),1), Xval]*b;
    yval_res = yval-yval_pred;
    res = yval_res;
    ypred = yval_pred;
end

varargout{1} = res;
varargout{2} = ypred;
end
