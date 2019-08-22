% Sky Hoffert

L = 1000;
NA = -30;
f = 10;
omega = 2*pi*f;
t = 0:(1/L):1;
v = 0:1:L;
r = 0.995;
bins = 1024;

for i = 1:L+1
    v(i) = sin(omega * t(i)) * (r) ^ i;
end

for i = 1:L+1
    v(i) = v(i) + wgn(1,1,NA);
end

T = -bins/2:1:bins/2-1;
f = real(fft(v,bins));

subplot(2,1,1);
plot(t,v);

subplot(2,1,2);
plot(T,f);
