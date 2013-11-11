all:

oslo-nodes.geojson: oslo-nodes.csv
	sort $^ | perl \
	-e 'print "{ \"type\": \"MultiPoint\",\n  \"coordinates\":\n  [\n";' \
	-e 'while (<>) { chomp; @f = split("\t"); next if 'longitude' eq $$f[0]; push(@a, sprintf("   [%s, %s]", $$f[0], $$f[1])); }' \
	-e 'print(join(",\n", @a), "\n");' \
	-e 'print "  ]\n}\n";' \
	> $@.new && mv $@.new $@
