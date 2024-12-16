11-12 Best
add 4482
addc 3386
biquad 17461
ccorr 1850652
corr 611889
conv 1849632
dotprod 896
dotprode 1021
fir 1059976
fird 276313
mul 4416
mulc 3373
sqrt 4343
sub 4496

11-13
storeinst seq adjust
add 4482 => 4418 
addc 3386 => 3320
sub 4496 => 4434

  %0 = and i32 %n.0125, 2147483640
  %1 = add nsw i32 %0, -1
  %2 = and i32 %1, -8
  %3 = add i32 %2, 8
  %4 = and i32 %n.0125, 2147483640
  %5 = icmp eq i32 %4, 0
  %6 = xor i32 %n.0125, -1
  =>
  %0 = and i32 %n.0125, -8
  %1 = and i32 %n.0125, 2147483640
  %2 = icmp eq i32 %1, 0
  %3 = xor i32 %n.0125, -1

ccorr 1850652 => 1845982
conv  1849632 => 1845437

try to add some common opt pass 
fir 1059976 => 1058299
fird 276313 => 275393

11-13 best
add 4418
addc 3322
biquad 17461
ccorr 1845983
corr 611912
conv 1845924
dotprod 896
dotprode 1021
fir 1058299
fird 275393
mul 4416
mulc 3373
sqrt 4343
sub 4434

11-14
dotprod 896
dotprode 1022
fir 1059273
fird 269115
biquad 17467
add 4419
addc 3319
mul 4420
mulc 3371
sqrt 4338
sub 4434
corr 596199
conv 1845956
ccorr 1845983

11-15
dotprod 886
dotprode 981
fir 1059273
fird 268967
biquad 17467
add 4419
addc 3319
mul 4420
mulc 3304
sqrt 4338
sub 4434
corr 596199
conv 1844526
ccorr 1846468

11-20
dotprod 891     4 5 6 7
dotprode 970    14 15 18 19
fir 1059273     78 79
fird 268967     82 83
biquad 16425    74 75 77
add 4419        103 104
addc 3319       100 101
mul 4420        117 118
mulc 3304       93 94
sqrt 4338       127
sub 4434        110 111 
corr 579718     176 177 180 181
conv 1792033    167 168 169 172 173 174 175
ccorr 1345493   159 160 162 164 166

12-6
dotprod 891     1834
dotprode 970    2090
fir 1059273     2007782
fird 268967     635082
biquad 16425    24611
add 4419        11312
addc 3319       10278
mul 4420        11312
mulc 3304       10275
sqrt 4338       8236
sub 4434        11317
corr 579718     2108491
conv 1792033    4612016
ccorr 1345493   4612949