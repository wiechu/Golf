import base64, math as M, re, struct, sys

j=int

_,SPS,VOL,SEQ=sys.argv
SPS=j(SPS)

sign = dLen = i = 0
D = []

for seq in SEQ.split(','):
    n,h,o,l=re.split('(#*)(\d*)\.',seq); signCoefficient = sign|1; sign = 1
    while lastSign := sign:
        if '|' > n: val = j(VOL) * signCoefficient * M.sin(i * 2 * M.pi / SPS * round(55 * 2**( j(o) - ('#A#G#FE#D#C'.find(h+n) + 11)/12 ) - 2e-4, 2));sign = 1-2*(val<0)
        else: val=lastSign=0

        i+=1
        if (i>SPS/j(l)) & (sign!=lastSign): i = 1; break

        D+=j(128+val),;dLen+=1

print(base64.b64encode(b'RIFF' + struct.pack('I8sIHHIIHH4sI', 44+dLen, b'WAVEfmt ', 16, 1, 1, SPS, SPS, 1, 8, b'data',dLen)+bytes(D)).decode())
