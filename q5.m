[y1,f1]=audioread('q5/1.wav');
[y2,f2]=audioread('q5/2.wav');
[y3,f3]=audioread('q5/3.wav');
[y4,f4]=audioread('q5/4.wav');
[y5,f5]=audioread('q5/5.wav');
y=[];
y{1}=y1;
y{2}=y2;
y{3}=y3;
y{4}=y4;
y{5}=y5;
sound(reorderDatagram(y,f1),f1);

function output=  reorderDatagram(y,fs)
starting=[];
ending=[];
order=[];
store=[];
output=[];
for i = 1:length(y)
    y1=y{i};
    t=(0:length(y1)-1)/fs;
    starting{i}=y1(t<5)';
    ending{i}=y1( (t>(length(y1)/fs-5)) & (t<(length(y1)/fs)) )';
    store=[ store ; [-4,0,0] ];
end
for s= 1:length(y)
    for e = 1:length(y)
        if s==e
            continue;
        end
        temp=max(xcorr(starting{s},ending{e}));
        if temp > store(1,1)
            store(1,1)=temp;
            store(1,2)=s;
            store(1,3)=e;
            store=sortrows(store);
        end
            
    end
end
final=store(2:length(y),2:3);
a=final(:,1);
b=final(:,2);
r=1:length(y);
first=setdiff(r,a);
disp(first);
output=medfilt1(y{first});
for i=1:(length(y)-1)
   index=find(b==first);
   first=a(index);
   disp(first);
   output=vertcat(output,medfilt1(y{first}));
   %output=[output y{first}];
end
end
