LIBSRC=libsrc
ODIN_FLAGS ?= -debug -o:none
D2J=0d/odin/das2json/das2json

run: nextgen_parsing_temp transpile.drawio.json
	./nextgen_parsing_temp main phi.drawio $(LIBSRC)/transpile.drawio

project.drawio.json: project.drawio $(LIBSRC)/transpile.drawio
	$(D2J) project.drawio
	odin build . $(ODIN_FLAGS)

transpile.drawio.json: $(LIBSRC)/transpile.drawio
	$(D2J) $(LIBSRC)/transpile.drawio

clean:
	rm -rf nextgen_parsing_temp nextgen_parsing_temp.dSYM
