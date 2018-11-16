function X = jacdd(A, b, X0, P, wucha, max1)
% 线性方程组AX=B的系数矩阵A和b，初始向量X0，范数的名称
% P=1，2，inf或'fro.'，近似解X的误差（经度）wucha和迭代
% 的最大次数max1
[n m] = size(A);
a = jspb(A)
for k = 1:max1
    for j = 1:m
        X(j) = ( b( j ) - A( j, [1 : j - 1, j + 1 : m] ) * X0( [ 1 : j-1, j + 1:m] ) ) / A(j, j);
    end
    disp(strcat(num2str(k), '次迭代>', num2str(X)))
    djwcX = norm( X' - X0, P); 
    xdwcX = djwcX/( norm(X', P) + eps); 
    X0 = X'; X1 = A\b;
    if ( djwcX < wucha ) & ( xdwcX < wucha)
        disp('请注意：雅可比迭代收敛，次方程组的精确解jX和近似解X如下：');
        return;
    end
end
if (djwcX > wucha ) & (xdwcX > wucha )
    disp('请注意：雅可比迭代次数已经超过最大迭代次数max1')
end
a, X = X; jX = X1';