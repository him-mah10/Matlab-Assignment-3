image=imread('cameraman.tif');
image=double(image);

image64=imresize(image,[64 64]);
image128=imresize(image,[128 128]);
image256=imresize(image,[256 256]);

pad128 = [ [ image64 zeros(64)] ; zeros(64,128)];
pad256 = [ [ image128 zeros(128)] ; zeros(128,256)];
pad512 = [ [ image256 zeros(256)] ; zeros(256,512)];

fft64 = fftshift(fft2(image64));
fft128 = fftshift(fft2(pad128));
fft256 = fftshift(fft2(pad256));
fft512 = fftshift(fft2(pad512));

figure, imagesc(log(abs(fft64)+1));
figure, imagesc(log(abs(fft128)+1));
figure, imagesc(log(abs(fft256)+1));
figure, imagesc(log(abs(fft512)+1));
