# Makefile

# Define a directory for all outputed objects to go
OUT_DIR := out

# Define the compilers we will be using
NASM := nasm
CC := clang
GCC := gcc

# First of all lets build all assembly files under boot/ for our bootloader
BOOT_DIR := boot
BOOT_INPUT := $(wildcard $(BOOT_DIR)/*.asm)
BOOT_OUTPUT := $(patsubst $(BOOT_DIR)/%.asm, $(OUT_DIR)/%.bin, $(BOOT_INPUT))

# Default target to build all the files
all: $(BOOT_OUTPUT)

# Rule to build our boot loader
$(OUT_DIR)/%.bin: $(BOOT_DIR)/%.asm
	@mkdir -p $(OUT_DIR)
	$(NASM) -f bin $< -o $@

# Rule to clean a build
clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean
