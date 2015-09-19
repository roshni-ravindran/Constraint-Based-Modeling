function [growthVec,fluxMat] = calcFluxesFixedGrowth(model, maxGrowth,growthRxnID)

fluxMat = [];
growthVec = [];
growthStep = maxGrowth/10;

for i=0:10
    growthVal = i*growthStep; 
    percent = (growthVal/maxGrowth)*100;
    growthVec = [growthVec percent];
    model = changeRxnBounds(model,growthRxnID,growthVal,'b');
    fbaTemp = optimizeCbModel(model);
    fluxMat(:,i+1) = fbaTemp.x;
end

end