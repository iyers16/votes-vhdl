# Compiler and Simulation
GHDL = ghdl
GTKWAVE = gtkwave

# VHDL source files (modify as needed)
SRC = vote2.vhdl vote_tb.vhdl

# Extract testbench name (last file without extension)
TB = $(basename $(word $(words $(SRC)), $(SRC)))

# Waveform output file
WAVE = $(TB).ghw

# Default target: Run everything
all: run

# Compile all VHDL files
analyze: $(SRC)
	@echo "🔹 Analyzing VHDL files..."
	$(GHDL) -a $^

# Elaborate the testbench
elaborate: analyze
	@echo "🔹 Elaborating Testbench: $(TB)"
	$(GHDL) -e $(TB)

# Run simulation and generate waveform
run: elaborate
	@echo "🔹 Running Simulation..."
	$(GHDL) -r $(TB) --wave=$(WAVE)

# Open GTKWave
view: run
	@echo "🔹 Opening GTKWave..."
	$(GTKWAVE) $(WAVE) &

# Clean generated files
clean:
	@echo "🧹 Cleaning up..."
	rm -f *.o *.cf *.ghw $(TB)

.PHONY: all analyze elaborate run view clean
