function sorted = findGeneTargets(model,growthRxnID,lightRxnID)
% given input model, find the gene targets for overexpression using
% robustness analysis of growth and light

initCobraToolbox; clc;
model = changeObjective(model,growthRxnID); % calculate max growth 
fbaTemp = optimizeCbModel(model);
maxGrowth = fbaTemp.f;

model = changeObjective(model,lightRxnID); % make light the objective

[growthVec, allFluxes] = calcFluxesFixedGrowth(model,maxGrowth,growthRxnID);

% verify by plotting light vs. growth
lightInd = find(strcmp(model.rxns,lightRxnID));
lightVec = allFluxes(lightInd,:);
plot(growthVec, lightVec);

sorted = testMonotonic(allFluxes);

% plot all decr. gene targets
number = length(sorted.decr);
f1 = max(factor(number));
f2 = number/f1;

figure
subhandles = panels(f1,f2,'top');

for i=1:length(sorted.decr)
    rxnVal = sorted.decr(i);
    y = allFluxes(rxnVal,:);
    
    subplot(subhandles(i));
    plot(lightVec,y);
    set(gca,'yticklabel','');
    set(gca,'xticklabel','');
    
end

end







