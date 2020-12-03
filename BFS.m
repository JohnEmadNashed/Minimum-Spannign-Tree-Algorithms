function v = BFS(adjacencyList,q,a,v)
[x,y]=size(adjacencyList(a,:));
for i=1:y+1
    if v(a)==1 & q.size ~= 0
        xa=q.pop();
        v=   BFS(adjacencyList,q,xa,v);
        
    else
        if i== y+1 & q.size ~= 0
            v(a)=1;
            xa=q.pop();
            v=   BFS(adjacencyList,q,xa,v);
        else
            if i== y+1
            else
                if adjacencyList(a,i)== 0 & q.size ~= 0
                    v(a)=1;
                    xa=q.pop();
                    v=BFS(adjacencyList,q,xa,v);
                else
                    if adjacencyList(a,i)~=0
                        if v( adjacencyList(a,i))==0
                            q.push(adjacencyList(a,i));
                        end
                    end
                end
            end
        end
    end
end
