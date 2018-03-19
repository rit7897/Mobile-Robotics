%taking F matrix correspondencies x1 and x2 and required threshold t 
%calculating sampson distance for each F matrix and checking it with
%threshold 
% storing inliers in bestInliers

function [d,bestInliers,bestF] = sampson_distance(F, x1,x2, t)
	x2tFx1 = zeros(1,length(x1));     
	for n = 1:length(x1)
	    x2tFx1(n) = x2(:,n)'*F*x1(:,n);
    end
    Ftx2 = F'*x2;
	Fx1 = F*x1;
    %calculating sampson distance based in F.
	d =  x2tFx1.^2 ./ ...
	     (Fx1(1,:).^2 + Fx1(2,:).^2 + Ftx2(1,:).^2 + Ftx2(2,:).^2);
	bestInliers = find(abs(d) < t);     %bestInliers giving indiceds of inlying pts
	bestF = F;                          % copying f to Best F
end
    