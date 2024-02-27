# NES FPGA 6502 Processor Decode Module

## Overview

This VHDL module implements the top-level decoder for the NES FPGA project. The decoder is responsible for interpreting incoming instruction bytes, deriving control signals, and facilitating proper instruction execution within the 6502 processor architecture.

## Design Architecture

The design architecture is structured around several key components:

1. **Predecode Register**: Processes the incoming instruction byte and prepares it for further decoding stages.

2. **Predecode Logic**: Interprets the predecoded instruction and derives additional control signals and information.

3. **Instruction Register**: Captures the final decoded instruction for further processing.

4. **Timing Generation Logic**: Generates timing signals required for proper instruction execution, synchronized with the CPU clock.

5. **Decode ROM**: Utilizes the decoded instruction and timing information to generate the appropriate control signals for the CPU.

## Signal Types

- **i**: Input
- **o**: Output
- **s**: Signal
- **t**: Testbench

## Signal Origins (Modules)

- **db**: Data bus
- **pr**: Predecode Register
- **pl**: Predecode Logic
- **ir**: Instruction Register
- **dr**: Decode ROM
- **tgl**: Timing Generator Logic
- **rcl**: Random Control Logic
- **irc**: Interrupt and Reset Control

## References

- **6502 Microprocessor:**
  - File: [6502.txt](https://www.nesdev.org/6502.txt)
- **The 6502/65C02/65C816 Instruction Set Decoded:**
  - File: [The 6502 Instruction Set Decoded.webarchive](https://llx.com/Neil/a2/opcodes.html)
- **6502 Cycle Times:**
  - Link: [6502 Cycle Times](https://www.nesdev.org/wiki/6502_cycle_times)
- **Hanson's Block Diagram:**
  - File: [6502-Block-Diagram.pdf](https://www.nesdev.org/wiki/Visual6502wiki/Hanson's_Block_Diagram)
- **Visual Transistor-level Simulation of the 6502 CPU:**
  - Link: [Visual Transistor-level Simulation of the 6502 CPU](http://www.visual6502.org)
