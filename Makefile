.PHONY : all clean install drutils tgrep2

all: drutils tgrep2

drutils:
	$(MAKE) -C DRUtils

tgrep2:
	$(MAKE) -C TGrep2

clean:
	$(MAKE) -C DRUtils clean
	$(MAKE) -C TGrep2 clean

install: drutils tgrep2
	$(MAKE) -C TGrep2 install
