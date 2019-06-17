
clc
clear all

a=imread('cameraman.tif');
ref=a;
%a1=a(200:600,200:600);
%ref=a1;
% figure(1)
% imshow(a);
a1=imnoise(a,'speckle',0.01);
ad=a1;

stepsize=0.005; 
nosteps=100;
%varargin=1;
%imshow(a)

%   imshow(a,'Border','tight',...      %# Display in a figure window without
%        'InitialMagnification',100);  %#    a border at full magnification
%    print('camera_256.eps','-depsc2','-r300');
%    imshow(ad,'Border','tight',...      %# Display in a figure window without
%        'InitialMagnification',100);  %#    a border at full magnification
%    print('camera_256_speckle_noisy_0.01.eps','-depsc2','-r300');
%    imshow(ad(128:256,64:192),'Border','tight',...      %# Display in a figure window without
%        'InitialMagnification',100);  %#    a border at full magnification
%    print('camera_64_speckle_noisy_0.01.eps','-depsc2','-r300');
b=dpad4(ad,ref,0.15,500,'cnoise',5,'big',5,'simp');
c=dpad2(ad,ref,0.15,500,'cnoise',5,'big',5,'simp');

figure(1)
b1=b/max(b(:));
figure(2)
c1=c/max(c(:));
% imshow(b1,'Border','tight',...      %# Display in a figure window without
%        'InitialMagnification',100);  %#    a border at full magnification
%    print('camera_256_dpad.eps','-depsc2','-r300');
%    b2=b1(128:256,64:192);
%    imshow(b2,'Border','tight',...      %# Display in a figure window without
%        'InitialMagnification',100);  %#    a border at full magnification
%    print('camera_64_dpad.eps','-depsc2','-r300');

% figure(2)
imshow(b1);
load psnr2
load mssim2
disp('mssim using second order PDE ')
[value idx]=max(mssim2)

load psnr4
load mssim4
%load tsteps
%disp('Mssim')
%[value idx]=max(mssim)
disp('mssim using fourth order PDE ')
[value idx]=max(mssim4)

