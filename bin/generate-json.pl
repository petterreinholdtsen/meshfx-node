#!/usr/bin/perl

use warnings;
use strict;

print '{ "type": "FeatureCollection",
  "features":
  [
';

my $first = 1;

my $header=<>;

while (<>) {
  if ($first) {
    $first = 0;
  }
  else {
    print ",\n";
  }
  my @elems = split /\t/;
  chomp($elems[4]);

  printf
'    { "type": "Feature",
       "properties":
       {
         "name"     : "%s",
         "MAC"      : "%s",
         "last-seen": "%s",
         "marker-symbol": "oil-well",
         "marker-color": "FF0000"
       },
       "geometry":
         { "type" : "Point",
           "coordinates": [%f, %f]
         }
    }', $elems[3], $elems[2], $elems[4], $elems[0], $elems[1];
}

print '
  ]
}
';
