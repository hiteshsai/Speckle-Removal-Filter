function y = isodifstep4(L, c)
% ISODIFSTEP   Isotropic diffusion step
%
%    y = ISODIFSTEP(x, d) calculates de isotropic (scalar) diffusion
%    step "y" based on the image "x" and on the diffusivity "d". If
%    "d" is constant the diffusion will be linear, if "d" is
%    a matrix the same size as "x" the diffusion will be nonlinear.
%
%    The diffused image is calculated as:
%      xd = x + T*isodifstep(x,d)  , T = step size
%

cpc=translateImage(c,1,0);
cmc=translateImage(c,-1,0);
ccp=translateImage(c,0,1);
ccm=translateImage(c,0,-1);


Lpc=translateImage(L,1,0);
%Lppc=translateImage(L,2,0);
Lpp=translateImage(L,1,1);
Lcp=translateImage(L,0,1);
%Lcpp=translateImage(L,0,2);
Lmp=translateImage(L,-1,1);
Lmc=translateImage(L,-1,0);
%Lmmc=translateImage(L,-2,0);
Lmm=translateImage(L,-1,-1);
Lcm=translateImage(L,0,-1);
%Lcmm=translateImage(L,0,-2);
%Lcmm=translateImage(L,0,-2);
Lpm=translateImage(L,1,-1);

Lx=0.5*(Lpc-Lmc);
Ly=0.5*(Lcp-Lcm);
Lxx=Lpc-2*L+Lmc;
Lxy=0.25*(Lpp+Lmm-Lmp-Lpm);
Lyy=Lcp-2*L+Lcm;

Lee=(Lxx.*(Lx.^2)+2*Lx.*Ly.*Lxy+Lyy.*(Ly.^2))./(Lx.^2+Ly.^2+eps); % Computes u_{zeta zeta} zeta: gradient direction
Lss=(Lxx.*(Ly.^2)-2*Lx.*Ly.*Lxy+Lyy.*(Lx.^2))./(Lx.^2+Ly.^2+eps); % Computes u_{psi psi} psi: level set direction
%f=c.*(Lxx+Lyy);
f=c.^2.*(Lee)+c.*Lss;

fpc=translateImage(f,1,0);
fmc=translateImage(f,-1,0);
fcp=translateImage(f,0,1);
fcm=translateImage(f,0,-1);

y=-(fpc+fmc+fcp+fcm-4*f);
