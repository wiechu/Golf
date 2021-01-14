<?php

[,$SPS,$VOL,$NOTES]=$argv;

foreach(explode(',',$NOTES) as $note) {
    $signCoefficient = $sign|1;
    for (
        # init
        $sign = preg_match('/(.#*)(.*)\.(.+)/', $note, $x )

        ;
        # condition
        $lastSign = $sign,
        $sign = 1 - 2 * (
            0 > $val =
                    Z>$note
                  ?
                    $VOL *
                    $signCoefficient *
                    sin( $i * 2 * pi() / $SPS * round( 55 * 2**( $x[2] - strpos( 'H#A#G#FE#D#C', strrev($x[1]) )/12 - 5/6 ) - 2e-4, 2) )
                  :
                    $lastSign = 0
        ),

        ++$i <= $SPS / $x[3] || $sign == $lastSign

        ;
        # update
        $Data.=chr( $val + 128 )
    )
    $Len++;

    $i = 1;
}

echo
    base64_encode(
        RIFF
        . pack( IA8ISSIISSA4I, $Len + 44, WAVEfmt, 16, 1, 1, $SPS, $SPS, 1, 8, data, $Len)
        . $Data
    );
