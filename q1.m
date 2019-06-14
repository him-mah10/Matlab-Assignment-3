file=csvread('houses.csv');

x_train=file(1:42,1:2);
x_train=[ones(42,1) x_train];
y_train=file(1:42,3);

%without normalizing
b=inv(x_train'*x_train)*x_train'*y_train;
x_test=[ones(5,1) file(43:47,1:2)];
y_test=file(43:47,3);
predicted_output=x_test*b;

%with normalization
aa=file(1:42,1);
bb=file(1:42,2);
maxia=max(aa);
minia=min(aa);
aa=aa-minia;
aa=aa/(maxia-minia);
maxib=max(bb);
minib=min(bb);
bb=bb-minib;
bb=bb/(maxib-minib);
%x_train_norm=[ normalize(file(1:42,1)) normalize(file(1:42,2))];
x_train_norm=[ones(42,1) aa bb];

aa=file(43:47,1);
bb=file(43:47,2);
aa=aa-minia;
aa=aa/(maxia-minia);
bb=bb-minib;
bb=bb/(maxib-minib);
x_test=[ones(5,1) aa bb];
b_norm=inv(x_train_norm'*x_train_norm)*x_train_norm'*y_train;
predicted_output_norm=x_test*b_norm;

%Finding l2 norm
temp=(y_test-predicted_output).^2;
a="L2 norm of predicted and ground truth house prices(without normalization): ";
disp(strcat(a,num2str(sqrt(sum(temp)))));

%Finding l2 norm using normalization
temp=(y_test-predicted_output_norm).^2;
a="L2 norm of predicted and ground truth house prices(with normalization): ";
disp(strcat(a,num2str(sqrt(sum(temp)))));

%output for house of size 1400 and 4 bedrooms
a="Price for house of size 1400 and having 4 bedrooms: ";
a=strcat(a,num2str(1400*b(2)+4*b(3)+b(1)));
disp(a);

%part 3
p=mean(file(:,1));
q=mean(file(:,2));
r=mean(file(:,3));
a="Predicted price for mean of all features: ";
a=strcat(a,num2str(p*b(2)+q*b(3)+b(1)));;
a=strcat(a,"   Actual mean price: ");
a=strcat(a,num2str(r));
disp(a);
