COMPILER = 			ghdl 
COMPILER_VERSION = 	--std=08
FLAGS = 			--ieee=synopsys
VHDL_FILES = 		$(wildcard *.vhd) 
WORKDIR = 			debug
TB = 				$(basename $(notdir $(wildcard tb_*.vhd)))
RUN_FLAGS = 		--vcd=$(TB).vcd

.PHONY: all
all: analyze run clean 

.PHONY: waveform
waveform: $(wildcard *.vcd)
	gtkwave $^

.PHONY: run
run: 
	$(COMPILER) --elab-run $(COMPILER_VERSION) $(FLAGS) --workdir=$(WORKDIR) $(TB) $(RUN_FLAGS)

.PHONY: analyze
analyze: 
	@mkdir -p $(WORKDIR)
	$(COMPILER) -a $(COMPILER_VERSION) $(FLAGS) --workdir=$(WORKDIR) $(VHDL_FILES)

.PHONY: clean
clean:
	@rm -rf *.o
	@rm -rf $(WORKDIR)