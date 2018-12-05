function makeAndSaveRandomForest(numTrees, dataSelect, filename)
    [x,u] = loadData(dataSelect);
    x = x';
    u = u';
    rf = TreeBagger(numTrees,x,u,'Method','regression');
    save(filename,'rf');
end