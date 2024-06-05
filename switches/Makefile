.SUFFIXES:

# Name of project and VHDL files
PROJECT = switches
VHDL_FILES = sw1.vhd
TESTBENCH_FILES = tb_switches.vhd

# Paths to Quartus II tools
QUARTUS_SH = quartus_sh
QUARTUS_PGM = quartus_pgm
MODELSIM_VSIM = vsim
MODELSIM_VCOM = vcom
MODELSIM_VLIB = vlib

QSF_FILE = $(PROJECT).qsf
SDC_FILE = $(PROJECT).sdc
SOF_FILE = output_files/$(PROJECT).sof
PROGRAM_FILE = $(SOF_FILE)
PIN_ASSIGNMENTS = pins.qsf

.PHONY: all # Compile the VHDL and program the FPGA (default target) 
all: compile program

PHONY: compile # compile the VHDL to SOF 
compile:
	$(QUARTUS_SH) --flow compile $(PROJECT)

.PHONY: program # programs the FPGA
program:
	$(QUARTUS_PGM) -c 1 -m JTAG -o "p;$(PROGRAM_FILE)"

.PHONY: simulate # Simulate the testbench 
simulate:
	# Compile the VHDL
	$(MODELSIM_VLIB) work
	$(MODELSIM_VCOM) -work work $(TESTBENCH_FILES) $(VHDL_FILES)
	# Launch the simulation
	$(MODELSIM_VSIM) -c work.tb_switches -do "run -all"

.PHONY: clean # Clean build files (incremental_db, output_files)
clean:
	$(RM) -rf db incremental_db output_files

.PHONY: help # Show this help message
help:
	@ cat $(firstword $(MAKEFILE_LIST)) \
		| grep -E "^.PHONY:"            \
		| cut -d ' ' -f 2,3-            \
		| sed 's/#/    		/g'
