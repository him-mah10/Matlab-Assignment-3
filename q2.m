f=imread('barbara.png');
g=imread('cameraman.tif');

f=imresize(f,[256 256]);
g=imresize(g,[256 256]);

F=fft2(f);
G=fft2(g);

I = ifft2(F.*G);
con = conv2(f,g);
con_center=con(128:128+255,128:128+255);

asd=(I-con_center).^2;
asd=sum(sum(asd));
asd=sqrt(asd);

f=[ [f zeros(256,255)];zeros(255,511)];
g=[ [g zeros(256,255)];zeros(255,511)];

F=fft2(f);
G=fft2(g);

I = ifft2(F.*G);

asd2=(I-con).^2;
asd2=sum(sum(asd2));
asd2=sqrt(asd2);
