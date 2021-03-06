CC = gcc -Wall -O4 -march=native
FLAGS = -DMACHINE_LINUX
DEBUG =

# Windows:
ifeq ($(HOSTTYPE),windows)
  FLAGS = -DMACHINE_WINDOWS
endif
# Macintosh:
ifeq ($(HOSTTYPE),macintosh)
  MAKE = make
  CC = cc -pipe -O3 -Wall -fno-common -arch ppc
  FLAGS = -DMACHINE_MACINTOSH
endif
# Alpha:
ifeq ($(HOSTTYPE),alpha)
  CC = cc -arch ev6 -fast -O4 -non_shared -ldnet_stub
  FLAGS = -DMACHINE_ALPHA
endif
# Sun4:
ifeq ($(HOSTTYPE),sun4)
  CC = gcc -Wall -O4
  FLAGS = -DMACHINE_SUN4
endif

OBJ=drutils.o hash.o svd.o
FLAGS += ${DEBUG}

.PHONY: clean debug 

libdrutils.a: $(OBJ)
	rm -f $@
	ar cr $@ $(OBJ)
	ranlib $@

debug:
	${MAKE} DEBUG=-DSMART_ALLOC libdrutils-dbg.a
libdrutils-dbg.a: $(OBJ)
	rm -f $@
	ar cr $@ $(OBJ)
	ranlib $@

drutils.o: drutils.c drutils.h system.h
	$(CC) $(FLAGS) -c drutils.c
hash.o: hash.c hash.h drutils.h
	$(CC) $(FLAGS) -c hash.c
svd.o: svd.c svd.h drutils.h
	$(CC) $(FLAGS) -c svd.c
clean:
	rm -f *.o libdrutils.a
