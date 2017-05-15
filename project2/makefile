# Existing variables:
#	${bindir} ../bin
#	${common_source} ../src/*c
#	${headers} ../headers
#	${common_libs} -Llib things


GCC = gcc

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
all: debug

.PHONY: release
release: FLAGS += -g -03
release: target

.PHONY: debug
debug: FLAGS += -g -O0
debug: $(target)
	
%.o : %.c
	$(GCC) -c $(FLAGS) $< ${headers:%=-I%} -o $@ $(LIBS)
	
$(target) : $(source:%.c=%.o)
	$(GCC) $< -o $@ $(LIBS)
	
clean:
	rm -f *.o
	rm -f $(target)
	
asm:
	objdump -S -d $(target) > $(target).asm 
	
