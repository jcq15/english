clear;
clc;
load data;

%正态分布密度函数
p = @(x,sigma,miu)(1/sqrt(2*pi*sigma.^2)*exp(-(x-miu).^2/(2*sigma.^2)));

%标准化系数
stand =  @(sigma,miu)( quad(@(x)p(x,sigma,miu),0,200) );

for k = 1:8
    x = num(:,k);
    pp = @(sigma,miu)1;
    
    for k3 = 1:34
        if abs(x(k3)-200) < 0.0001
            %x(k3) = 300;
            continue
        end
        pp = @(sigma,miu)( pp(sigma,miu) * p(x(k3),sigma,miu) );
        %p(x(k3),2,3)
    end
    lik = @(sigma,miu)( pp(sigma,miu)./stand(sigma,miu)*(-1) );
    %x0 = [0,0];
    %lik(2,3)
    
%     % 自变量  
%     xx = 1:200;    
%     y = 0:2:1000;   
%     % 因变量  
%     xlen = length(xx);  
%     ylen = length(y);  
%     z = zeros(ylen,xlen);  
%     for i = 1:xlen  
%         for j = 1:ylen  
%             z(j,i) =  (-1)*lik(xx(i),y(j)) ;
%         end  
%     end  
% 
%     [xxx,yy]=meshgrid(xx,y);  
%     figure;
%     mesh(xxx,yy,z)  
%     xlabel('x');ylabel('y');zlabel('z');  

    x0 = [60;300];
    fuck = @(x)( lik(x(1),x(2)) );
    [x,fmin] = fminsearch(fuck,x0)
end

