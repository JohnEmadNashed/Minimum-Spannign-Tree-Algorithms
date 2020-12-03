clear all
close all
clc
a=[0 0 0 0 0 0];
for N=5:5:30
    adjacencyMatrix=zeros(N); % Edges
    vertices=zeros(2,N); % Nodes
    adjacencyList=zeros(N);% adjacencyList
    q=CQueue; % my queue
    v=zeros(1,N);
    xa=zeros(N);
    mat=zeros(N);
    ma=zeros(N);
    adjacencyMatrix=rand(N);    %vertecis
    vertices=10*rand(2,N);    %edges
    cor=vertices.';
    c=0;
    tic
    %-----------initialize the adjacency matrix--------------
    for i=1:N
        for j=1:N
            if i==j
                adjacencyMatrix(i,j)=0;
            end
            if adjacencyMatrix(i,j)<0.5
                adjacencyMatrix(i,j)=0;
            else
                adjacencyMatrix(i,j)=10*rand(1,1);
                adjacencyMatrix(j,i)=adjacencyMatrix(i,j);
            end
        end
    end
    % ----------------for the plot-------------------
    for z=1:(N*N)
        if adjacencyMatrix(z)~=0
            ma(z)=1;
        end
    end
    %-----------------------all vertecise------------------------
    figure(N+1)
    gplot(ma,cor,'x-')
    ylabel('yaxis')
    xlabel('xaxis')
    title('All Vertecies')
    %---------------------make the adjacency list--------------------------
    for i=1:N
        c=1;
        for j=1:N
            if adjacencyMatrix(i,j)~= 0
                adjacencyList(i,c)=j;
                c=c+1;
            end
        end
    end
    %-----------verify that the random network created is connected----
    [r,c]=size(adjacencyList);
    for i=1:N
        for j=1:size(adjacencyList(i))
            adjacencyList(i,j);
        end
    end   
    %----------------------------------BFS-------------------------------
    
    v=BFS(adjacencyList,q,1,v);
    xc=sum(v);
    if xc==N
        isConected=true
    else
        continue
    end
    
    %------------------------kruskal MST-----------------------------------
    xa=kruskal(adjacencyMatrix,N);
    
    for z=1:N*N
        if xa(z)~=0
            mat(z)=1;
        end
    end
    %----------------------Drawing the MST-------------------------
    figure(N+2)
    gplot(mat,cor,'o--')
    ylabel('yaxis')
    xlabel('xaxis')
    title('MST')
    
    %----------------------Drawing the runing time-------------------------
    a(N/5)=toc ; %run time vector
    noOfVert(N/5)=N;
    N=N+5;
end
%     end
% end
figure (1)
plot (noOfVert,a)
ylabel('Run time')
xlabel('No of vertices')
