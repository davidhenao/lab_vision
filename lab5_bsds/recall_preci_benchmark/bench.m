
imgDir = 'images/test';
gtDir = 'groundTruth/test';
pbDir = 'watersheds';
outDir = 'data/test_4';
mkdir(outDir);

nthresh = 99; % note: the code changes this to the actual number of segmentations
tic;
boundaryBench(imgDir, gtDir, pbDir, outDir, nthresh);
toc;
plot_eval(outDir)
