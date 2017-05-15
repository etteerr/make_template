SUBDIRS = project1 project2


extra_cmd = 
bindir = ${CURDIR}/bin
common_src = $(wildcard ${CURDIR}/src/*.c)
headers = ${CURDIR}/headers
common_libs = 



all: subdirs

.PHONY: subdirs $(SUBDIRS)
.PHONY: all
.PHONY: debug
.PHONY: release
.PHONY: asm


subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(extra_cmd) 	bindir=$(bindir) common_source=$(common_src) headers=$(headers) common_libs=$(common_libs)
	
debug: extra_cmd = debug
debug: subdirs

release: extra_cmd = release
release: subdirs

asm: extra_cmd = asm
asm: subdirs

test:
	echo $(common_src)
	echo $(common_head)
	echo $(bindir)
	
.PHONY: clean	
clean: extra_cmd = clean
clean: subdirs