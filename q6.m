input=imread('cameraman.tif');
input=im2double(input);
avg_input=average_filter(input,8);
subplot(1,2,1);
imshow(avg_input);
title("Using first method");
avg_better=average_better(input,8);
subplot(1,2,2);
imshow(avg_better);
title("Using second method");

xaxis=[];
normal=[];
better=[];

for i=3:5:40
    tic;
    image=average_filter(input,i);
    toc;
    xaxis=[xaxis;i];
    normal=[normal;toc];
end

for i=3:5:40
    tic;
    image=average_better(input,i);
    toc;
    better=[better;toc];
end

figure,
plot(xaxis,normal);
title('Blue-1st approach     Orange-2nd approach');
ylabel('Time');
xlabel('Input Size');
hold on;
plot(xaxis,better);
hold off;

function output = average_filter(input,k)
ip = padarray(input,[k-1 k-1],0,'pre');
ic = im2col(ip, [k k]);
avg = sum(ic);
avg=avg./(k*k);
output = col2im(avg, [k k], size(ip));
end

function output = average_better(input,k)
ip = padarray(input,[k-1 k-1],0,'pre');
ic = im2col(ip, [1 k]);
avg = sum(ic,1);
avg=avg./(k*k);
[m n]=size(input);
output = zeros(m,n);
j=1:n-1;
output(1,j) = sum(avg((j-1)*(n+k-1)+1:(j-1)*(n+k-1)+k),2);
for i=2:m
        output(i,j) = output(i-1,j) + avg( (j-1)*(m+k-1)+k-1+i ) - avg((j-1)*(m+k-1)+i-1);
end
end
