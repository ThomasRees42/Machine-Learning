disp('Things you can do in Octave');
5 + 6
6 - 2
4 * 3
12 / 3
5 ^ 2
1 == 1
1 ~= 2
3 > 4
3 >= 5
a = 'hi'
disp(a);
b = pi
disp(sprintf('2 dp:%0.2f',b));
A = [1 2; 3 4; 5 6]
v = [1 2 3]
v = [1; 2; 3]
v = 1:0.1:2
v = 1:6
c = 2*ones(2,3)
d = zeros(1,3)
e = rand(3,3)
f = randn(1,3)
g = 6 + sqrt(10)*(randn(1,10000));
hist(g,50)
eye(4)
size(A)
size(A,1)
size(A,2)
length(v)
A(:,2)
A(2,:)
A(:,2) = [10; 11; 12]
A = [A, [100; 101; 102]]