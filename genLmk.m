%% Generate Landmarks
function lmkLoc = genLmk(lambda, radiusMap)

lmkNum = poissrnd(lambda);
lmkLoc = genUniLoc(radiusMap, lmkNum);

end