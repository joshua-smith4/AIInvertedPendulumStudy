function makeAndSaveSVM(dataSelect, filename)
    [x,u] = loadData(dataSelect);
    x = x';
    u = u';
    svm = fitrsvm(x,u);
    save(filename,'svm');
end