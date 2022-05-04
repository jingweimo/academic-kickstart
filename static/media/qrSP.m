function SEL = qrSP(X, m_max, autoscaling)
% Input:
%   X: spectral matrix
%   m_max: the maximum number of wavelengths to keep
%   autoscaling: option for autoscaling of the spectral data

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
if nargin==1
    m_max = min(N-1,K); 
    autoscaling = 0; 
end
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
    SEL(:,k) = projections_qr(Xn,k,m_max);
    loopEnd = loopStart + (now-loopStart)*K/k;
    waitbar(k/K,h,['Successive Projections. ETC: ' datestr(loopEnd)]);
end
close(h);

fprintf('\n Successive Projections DONE!\n');
end

function chain = projections_qr(X,k,M)
% projections based on QR factorization 

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

