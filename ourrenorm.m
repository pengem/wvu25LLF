%% renormalizes data; 
err=10.0e-07; %Error tolerance 
N=1; while abs(v(N)-v(1))<err, N=N+1; end
nmin1=N; N=1; while abs(wr(N)-w(1))<err, N=N+1; end
nmin2=N; lmin=min(nmin1-1,nmin2-1);
N=lx; while abs(v(N)-v(lx))<err, N=N-1; end
nmax1=N; N=lx; while abs(w(N)-w(lx))<err, N=N-1; end
nmax2=N; lmin=min(nmin1-2,nmin2-2);
lmax=max(nmax1+2,nmax2+2);
if lmin < 1,  lmin=1;  end
if lmax > lx, lmax=lx; end
x((lmax+1):lx)=[];  x(1:(lmin-1))=[];
v((lmax+1):lx)=[]; v(1:(lmin-1))=[];

w((lmax+1):lx)=[]; w(1:(lmin-1))=[];

lx=lmax-lmin+1;


