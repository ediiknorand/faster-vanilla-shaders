RSCPACK=FasterVanillaShaders

$(RSCPACK).zip:
	(cd resourcepack/ && zip -r -9 $@ .)
	mv resourcepack/$(RSCPACK).zip .

clean: $(RSCPACK).zip
	rm -f $<
