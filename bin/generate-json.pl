#!/usr/bin/perl

print '{ "type": "FeatureCollection",
  "features":
  [
';

$first = 1;

$header=<>;

while (<>) {
  if ($first) {
    $first = 0;
  }
  else {
    print ",\n";
  }
  @elems = split /\t/;
  chomp($elems[4]);

 $elems[3];
  printf
'    { "type": "Feature",
       "properties":
       {
         "name"     : "%s",
         "MAC"      : "%s",
         "last-seen": "%s"
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
