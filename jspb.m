function a = jspb(A)
[n m] = size(A);
    for j = 1:m
        a(j) = sum( abs( A( :, j) ) ) - 2 * ( abs(A ( j, j) ) );
    end
    for i = 1:n
        if a(i) >= 0
            disp('请注意：系数矩阵A不是严格对角占优的，此雅可比迭代不一定收敛')
            
            return
        end
    end
    if a(i) < 0
        disp('请注意：系数矩阵A是严格对角占优的，此方程组有唯一解，且雅可比迭代收敛')
    end
    