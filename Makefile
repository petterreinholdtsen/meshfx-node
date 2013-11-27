all: oslo-nodes.geojson sandnes-nodes.geojson

%.geojson: %.csv bin/generate-json.pl
	bin/generate-json.pl $< > $@.new && mv $@.new $@
