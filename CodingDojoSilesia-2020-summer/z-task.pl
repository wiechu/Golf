#!/usr/bin/perl
# To daje 428 / 404
( $K, $_, $P[7] ) = @ARGV;
/(.)(\D)/, push @R, [ $`, $1, $P[$1][$`] = $2, $', $` * 4 ^ 56 * $1 ^ 5 ] for split ",";

map {
    map {
        ( $I, $O ) = ( $X, $Y, $M, $Q, $N, $L ) = @$_;

        # XXX code like: '$i--if$i>0' you can use: '$i-=$i>0'
        $M = "R" if "S" eq $M && ++$L > 13;

        $N ^= $N << 13;
        $N ^= $N >> 17;
        $J = 1 - 2 * ( ( $N ^= $N << 5 ) & 1 );
        $N & 2 ? ( $O += $J ) : ( $I += $J );

        # Trik z & zamiast && ----------------------|
        $P[$Y][$X] = 0, $Y = $O, $X = $I % 8 if !$Q & !$P[ $O %= 8 ][ $I % 8 ];

        map {
            $M = "S"
              if $P[ ( $Y + int( $_ / 3 ) + 1 ) % 8 ][ ( $X - 1 + $_ % 3 ) % 8 ]
              eq "S"
        } -8 .. 0 if "H" eq $M;

        $_ = [ $X, $Y, $P[$Y][$X] = $M, $Q, $N %= 1 << 30, $L ]
      } @R
} 1 .. $K;

for $X (@P) { @$X[8] = $/; print $_|| "." for @$X }
