function net = trainFitNet(layers, dataSelect)
    net = fitnet(layers);
    [x,u] = loadData(dataSelect);
    net = train(net,x,u);
end