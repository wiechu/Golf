#!/usr/bin/perl

# author: wiechu
#   task: Coding Dojo Silesia Code Golf 2020 Christmas Edition
#    url: http://golf.coding-dojo-silesia.pl/


# 1) use barewords
#       s/'Z'/Z /;
#       s/'RIFF'/RIFF/;
#       s/'WAVEfmt'/WAVEfmt/;
#       s/'data'/data/;

# 2) $NOTES
#       s/,\$NOTES/,\$_/;
#       s/\$NOTES=~//;

use strict;
use MIME::Base64;

# variables

my @Data;
my $lastSign;
my $val;
my $signCoefficient;
my $sign = 0;
my $i = 0;

###############################################################################
#
# Let's rock!
#
my ( $SPS, $VOL, $NOTES ) = @ARGV;

map {

    # for the first iteration $signCoefficient = 1
    $signCoefficient = $sign || 1;

    # C-style loop
    for (
        #
        # init loop
        #

        # /…/ always match, so $sign = 1
        $sign = /(#*)(\d*)\./
        # note   – $`   – string preceding whatever was matched by the last successful pattern match
        # hash   – $1   – first match
        # octave – $2   – second match
        # length – $'   – string following whatever was matched by the last successful pattern match

        ;

        #
        # test loop condition
        #
        $lastSign = $sign,

        $sign = (
            $val =
              # 'Z' < '|'
              'Z' lt $`
            ?
                # pause
              $lastSign = 0
            :
                # note: $`$1$2
              $VOL * $signCoefficient *
                # atan2(1,1) == π/4
              sin $i * 8 * atan2( 1, 1 ) / $SPS *
                # frequency
                (.01*int 2750 * 2**( $2 + ( 1 - index '#A#G#FE#D#C', $1.$` ) / 12 )  + .48)
        ) < 0 ? -1 : 1,


        ++$i <= $SPS / $' || $lastSign == $sign

        ;

        #
        # update
        #
        push @Data, $val + 128

      )
    {
        # do nothing
    }

    $i = 1;

} $NOTES =~ /[^,]+/g;

print encode_base64
  'RIFF' .
  pack 'IA8ISSIISSA4IC*', @Data + 44, 'WAVEfmt', 16, 1, 1, $SPS, $SPS, 1, 8, 'data', @Data + 0, @Data


# the end
