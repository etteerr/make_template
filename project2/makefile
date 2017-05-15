# Existing variables:
#	${bindir} ../bin
#	${common_source} ../src/*c
#	${headers} ../headers
#	${common_libs} -Llib things


builder = gcc
linker = gcc

FLAGS = 
LIBS = 

#Binary target file
target = ${bindir:%=%/}test-bin
source = main.c

#--- Common source files and headerfiles from arguments ---
# Adds *.c files from ../src
source += ${common_source}
# Adds libs from common
LIBS += ${common_libs}

.PHONY: all
all: release

.PHONY: release
release: FLAGS += -g -O3
release: $(target)

.PHONY: debug
debug: FLAGS += -g -O0
debug: $(target)
	
%.o : %.c
	$(builder) -c $(FLAGS) $< ${headers:%=-I%} -o $@ $(LIBS)
	
$(target) : $(source:%.c=%.o)
	$(linker) $< -o $@ $(LIBS)
	
clean:
	rm -f *.o
	rm -f $(target)
	rm -f $(target:%=%.asm)
	
asm:
	objdump -S -d $(target) >  $(target:%=%.asm)
	
