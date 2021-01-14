#!/usr/bin/ruby

SPSs,VOL,SEQ=$*
SPS=SPSs.to_i

Wave=[]
wLen=sign=i=0

SEQ.split(?,).map{|note|signCoefficient=sign|1

    sign=note=~/(#*)(\d*)\./
    # note   – $`
    # hash   – $1
    # octave – $2
    # length – $'

    loop{lastSign=sign
        sign=(val=?|>$` ? signCoefficient*VOL.to_i*Math.sin(i*2*Math::PI/SPS*(55*2**($2.to_i - ('H#A#G#FE#D#C'.index($1+$`)+10)/12.0 )-2e-4).round(2)):lastSign=0)<0?-1:1
        (i+=1)>SPS/$'.to_i&&sign!=lastSign&&break
        Wave[wLen] = 128+val
        wLen+=1
    }

    i=1
}

puts ['RIFF' + ( [ 44+wLen,'WAVEfmt',16,1,1,SPS,SPS,1,8,'data',wLen ] + Wave ).pack('IA8ISSIISSA4IC*') ].pack 'm0'
