function f = estimateFundamentalMatrix(pts1,pts2)

[pts1,t1] = normalise(pts1);
[pts2,t2] = normalise(pts2);

number = size(pts1,2);

a = zeros(number,9);

for i=1:number
    a(i,:) = kron(pts2(:,i)',pts1(:,i)');
end

[~,~,V] = svd(a);
f = reshape(V(:, end), 3, 3)';


[U, S, V] = svd(f);
S(3,3) = 0;
f = U * S * V';

f = t2' * f * t1;
%f = f / norm(f);
f = f/f(end);
if f(end) < 0
  f = -f;
end
end

