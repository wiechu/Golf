import sys,base64,re,math as M,struct
j=int
_,Q,V,A=sys.argv
Q=j(Q)
s=L=i=0
D=[]
for a in A.split(','):
 n,m,o,l=re.split('(#*)(\d*)\.',a);c=s|1;s=1
 while r:=s:
  if'|'>n:v=j(V)*c*M.sin(i*2*M.pi/Q*round(55*2**(j(o)-('#A#G#FE#D#C'.find(m+n)+11)/12)-2e-4,2));s=1-2*(v<0)
  else:v=r=0
  i+=1
  if(i>Q/j(l))&(s!=r):i=1;break
  D+=j(128+v),;L+=1
print(base64.b64encode(b'RIFF'+struct.pack('I8sIHHIIHH4sI',44+L,b'WAVEfmt ',16,1,1,Q,Q,1,8,b'data',L)+bytes(D)).decode())