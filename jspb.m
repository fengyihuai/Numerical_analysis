function a = jspb(A)
[n m] = size(A);
    for j = 1:m
        a(j) = sum( abs( A( :, j) ) ) - 2 * ( abs(A ( j, j) ) );
    end
    for i = 1:n
        if a(i) >= 0
            disp('��ע�⣺ϵ������A�����ϸ�Խ�ռ�ŵģ����ſɱȵ�����һ������')
            
            return
        end
    end
    if a(i) < 0
        disp('��ע�⣺ϵ������A���ϸ�Խ�ռ�ŵģ��˷�������Ψһ�⣬���ſɱȵ�������')
    end
    