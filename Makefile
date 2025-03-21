# SPDX-License-Identifier: GPL-2.0
VERSION = 1
PATCHLEVEL = 0
SUBLEVEL = 0

# Assign our compilers
NASM := nasm
CC := clang
GCC := gcc

# Build directory
OUT := out

# Firstly we need to declare the source files for our primary boot loader
BOOT_SOURCE := $(wildcard boot/*.asm)
BOOT_OUTPUT := $(patsubst boot/%.asm, $(OUT)/%.bin, $(BOOT_SOURCE))

# Default target to build all the files
all: $(BOOT_OUTPUT)

# Rule to build our boot loader
$(OUT)/%.bin: boot/%.asm
	@mkdir -p $(OUT)
	$(NASM) -f bin $< -o $@

# Clean a build
clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean
