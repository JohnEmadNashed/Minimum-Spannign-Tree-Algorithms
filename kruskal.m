function matrix = kruskal(adjacencyMatrix,N)
aa=adjacencyMatrix;
x=zeros(N);
matrix=zeros(N);
%----------------for simplicity--------------
min=10;
%----------------zeros under the diagonal----------------
for i=1:N
    for j=1:N
        if i>j
            aa(i,j)=0;
        end
    end
end
%-------------------------put all the numbers in a ------------------------
z=1;
for i=1:N
    for j=1:N
        if aa(i,j)~=0
            a(z)=aa(i,j);
            z=z+1;
        end
    end
end
a= sort(a);
sizea=size(a);
set=zeros(N);%the sets
count=0;% to make number of edges = N-1
%------------------------sets -----------------------------
for z=1:sizea(2)
    for i=1:N
        for j=1:N
            if z<sizea(2)
                if aa(i,j)==a(z)
                    if a(z)~=0
                        if count<N-1
                            %---------------new edge connecting 2 sets----------------
                            for counter = 1:N-1
                                for u=1:N-counter
                                    if set(counter,i)~=0 & set(counter+u,j)~=0
                                        matrix(i,j)=a(z);
                                        set(counter,:)= set(counter,:)+set(counter+u,:);
                                        set(counter+u,:)=0;
                                        a(z)=0;
                                        z=z+1;
                                        count=count+1;
                                    else
                                        if set(counter+u,i)~=0 & set(counter,j)~=0
                                            matrix(i,j)=a(z);
                                            set(counter+u,:)= set(counter+u,:)+set(counter,:);
                                            set(counter,:)=set(counter+u,:);
                                            set(counter+u,:)=0;
                                            a(z)=0;
                                            z=z+1;
                                            count=count+1;
                                        end
                                    end
                                end
                            end
                            %------------ a and b are in the same row end else put them in the row that needs
                            %------------put the least edge in the matrix
                            if sum(sum(set,2))==0
                                matrix(i,j)=a(z);
                                set(1,i)=1;
                                set(1,j)=1;
                                count=count+1;
                                a(z)=0;
                                z=z+1;
                                break
                            end
                            %
                            for cou = 1:N
                                aaaaa= sum(set,2);
                                if set(cou,i)==0 && set(cou,j)==0 && aaaaa(cou)==0
                                    matrix(i,j)=a(z);
                                    set(cou,i)=1;
                                    set(cou,j)=1;
                                    a(z)=0;
                                    count=count+1;
                                    z=z+1;
                                    break
                                else
                                    if set(cou,i)==0 && set(cou,j)~=0
                                        matrix(i,j)=a(z);
                                        set(cou,i)=1;
                                        set(cou,j)=1;
                                        a(z)=0;
                                        count=count+1;
                                        z=z+1;
                                        break
                                    else
                                        if set(cou,i)~=0 && set(cou,j)==0
                                            matrix(i,j)=a(z);
                                            set(cou,i)=1;
                                            set(cou,j)=1;
                                            a(z)=0;
                                            count=count+1;
                                            z=z+1;
                                            break
                                        else
                                            if set(cou,i)~=0 && set(cou,j)~=0
                                                if z<sizea(2)
                                                    a(z)=0;
                                                    z=z+1;
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end
