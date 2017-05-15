# Existing variables:
#	${bindir} ../bin
#	${common_source} ../src/*c
#	${headers} ../headers
#	${common_libs} -Llib things


builder = gcc
linker = gcc

#Flags to pass. Note: These are regardless of debug and release
FLAGS = 
#libs, idem
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
#Release settings, adds release flags
release: FLAGS += -g -O3
release: $(target)

.PHONY: debug
#debug, adds debug settings (flags)
debug: FLAGS += -g -O0
debug: $(target)
	
#build all object files (includes common source), headers are also included.
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
	
