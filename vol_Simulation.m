function [pe,obsNum] = vol_Simulation(evalNum, radiusMap, lambda, epsilon)
%VOL_SIMULATION Summary of this function goes here
%   Detailed explanation goes here

% % Input Parameter
% evalNum = 1000; % Number of Evaluations
% radiusMap = 50; % Map Size
% lambda = 8; % Arrival Intensity
% epsilon = 10;

pe = zeros(1, evalNum);
obsNum = zeros(1, evalNum);
parfor j = 1:evalNum
    lmkLoc_0 = genLmk(lambda, radiusMap); % Lmks on Map
    N_0 = length(lmkLoc_0);
    Angles_0 = angle(lmkLoc_0) ./ pi .* 180;
    Ranges_0 = abs(lmkLoc_0);
    [~, I] = sort(Angles_0);
    rangesVec_0 = Ranges_0(I);
    
    patternDist = zeros(1, evalNum);
    for i = 1:evalNum
        lmkLoc = genLmk(lambda, radiusMap); % Lmks on Map
        if length(lmkLoc) ~= N_0
            patternDist(i) = Inf;
            continue
        end
        Angles = angle(lmkLoc) ./ pi .* 180;
        Ranges = abs(lmkLoc);
        [~, I] = sort(Angles);
        rangesVec = Ranges(I);
        patternDist(i) = vecnorm(rangesVec - rangesVec_0, Inf);
    end
    obsNum(j) = N_0;
    pe(j) = sum(patternDist < epsilon)/evalNum;
end

end

