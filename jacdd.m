function X = jacdd(A, b, X0, P, wucha, max1)
% ���Է�����AX=B��ϵ������A��b����ʼ����X0������������
% P=1��2��inf��'fro.'�����ƽ�X�������ȣ�wucha�͵���
% ��������max1
[n m] = size(A);
a = jspb(A)
for k = 1:max1
    for j = 1:m
        X(j) = ( b( j ) - A( j, [1 : j - 1, j + 1 : m] ) * X0( [ 1 : j-1, j + 1:m] ) ) / A(j, j);
    end
    disp(strcat(num2str(k), '�ε���>', num2str(X)))
    djwcX = norm( X' - X0, P); 
    xdwcX = djwcX/( norm(X', P) + eps); 
    X0 = X'; X1 = A\b;
    if ( djwcX < wucha ) & ( xdwcX < wucha)
        disp('��ע�⣺�ſɱȵ����������η�����ľ�ȷ��jX�ͽ��ƽ�X���£�');
        return;
    end
end
if (djwcX > wucha ) & (xdwcX > wucha )
    disp('��ע�⣺�ſɱȵ��������Ѿ���������������max1')
end
a, X = X; jX = X1';