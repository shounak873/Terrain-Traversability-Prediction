%close all;

clear;
clc;

% nRows = 7;
% nCols = 7;

nNodes = 7;

adj = zeros(7);
adj(1,2) = 1;adj(2,1) = 1;
adj(1,3) = 1;adj(3,1) = 1;
adj(2,4) = 1;adj(4,2) = 1;
adj(3,4) = 1;adj(4,3) = 1;
adj(3,5) = 1;adj(5,3) = 1;
adj(4,6) = 1;adj(6,4) = 1;
adj(5,6) = 1;adj(6,5) = 1;
adj(5,7) = 1;adj(7,5) = 1;
adj(6,7) = 1;adj(7,6) = 1;


nStates = 3; % blue, green, yellow


cfMat = [0.7, 0.2, 0.1;...
        0.7, 0.2, 0.1;...
        0.3, 0.6, 0.1;...
        0.7, 0.1, 0.2;...
        0.3, 0.6, 0.1;...
        0.4, 0.5, 0.1;...
        0.1, 0.3, 0.6];

node_indices = [1, 2, 3, 4, 5, 6, 7];

edgeStruct = UGM_makeEdgeStruct(adj,nStates);
nEdges = edgeStruct.nEdges;


nodePot = cfMat;
       
    
maxState = max(edgeStruct.nStates);
edgePot = zeros(maxState,maxState,edgeStruct.nEdges);


% edge 1-2
edgePot(:,:,1) = [0.6, 0.2, 0.2;...
                  0.2, 0.6, 0.2;...
                  0.2, 0.2, 0.6];
              
% edge 1-3
edgePot(:,:,2) = [0.3, 0.6, 0.1;...
                  0.6, 0.3, 0.1;...
                  0.4, 0.4, 0.2];

% edge 2-4
edgePot(:,:,3) = [0.6, 0.2, 0.2;...
                  0.2, 0.6, 0.2;...
                  0.2, 0.2, 0.6];
              
% edge 3-4
edgePot(:,:,4) = [0.3, 0.6, 0.1;...
                  0.6, 0.3, 0.1;...
                  0.4, 0.4, 0.2];

% edge 3-5
edgePot(:,:,5) = [0.6, 0.2, 0.2;...
                  0.2, 0.6, 0.2;...
                  0.2, 0.2, 0.6];
              
% edge 4-6
edgePot(:,:,6) = [0.3, 0.6, 0.1;...
                  0.6, 0.3, 0.1;...
                  0.4, 0.4, 0.2];

% edge 5-6
edgePot(:,:,7) = [0.6, 0.2, 0.2;...
                  0.2, 0.6, 0.2;...
                  0.2, 0.2, 0.6];
              
% edge 5-7
edgePot(:,:,8) = [0.3, 0.6, 0.1;...
                  0.6, 0.3, 0.1;...
                  0.4, 0.4, 0.2];
              
% edge 6-7
edgePot(:,:,9) = [0.3, 0.6, 0.1;...
                  0.6, 0.3, 0.1;...
                  0.4, 0.4, 0.2];


clamped = zeros(nNodes,1);
 %if a node has a measurement, set that to the measured state
 %example: if node 5 is state 3, then clamped(5) = 3; 
 
burnIn = 1000;
%edgeStruct.maxIter = 10000;

[nodeBel,edgeBel,logZ] = UGM_Infer_MeanField(nodePot,edgePot,edgeStruct);
%[nodeBel,edgeBel,logZ] = UGM_Infer_Conditional(nodePot,edgePot,edgeStruct,clamped,@UGM_Infer_MeanField);









