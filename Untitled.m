load data;
x = 20:20:180
a = zeros(9,8)
for i = 1:9
    for j = 1:8
        a(i,j) = 1 - normcdf((x(i) - dt(j,2))/dt(j,1));
    end
end
a