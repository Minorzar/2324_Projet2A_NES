# NES FPGA 6502 Processor Decode Module

## Overview

This VHDL module implements the top-level decoder for the NES FPGA project. The decoder is responsible for interpreting incoming instruction bytes, deriving control signals, and facilitating proper instruction execution within the 6502 processor architecture.

## Top-Level Module

- **decode.vhd**: This module serves as the top-level decoder for the NES FPGA project. The decoder is responsible for interpreting incoming instruction bytes, deriving control signals, and facilitating proper instruction execution within the 6502 processor architecture.

## Design Architecture

The design architecture is structured around several key components:

1. **Predecode Register**: The predecode register latches the input instruction from the data bus on the rising edge of the clock signal and provides the latched instruction as output on subsequent clock edges.

2. **Predecode Logic**: The predecode logic block has three main functions:
   - Indicate if an opcode is one cycle via the implied output.
   - Indicate if an opcode is two cycles via the `o_pl_tzpre` output.
   - Pass the opcode to the instruction register or pass all zeros if `clear_ir` is high.

3. **Instruction Register**: The instruction register latches the input instruction on the rising edge of the clock signal and provides the latched instruction as output on subsequent clock edges.

4. **Timing Generation Logic**: This module generates timing signals indicating the current cycle of the CPU operation and handles resets based on control signals.

5. **Decode ROM**: The decode ROM decodes the input instruction register and timing information to generate outputs for a PLA. The PLA outputs are determined based on specific logic expressions derived from the input values.

## Signal Types

- **i**: Input
- **o**: Output
- **s**: Signal
- **t**: Testbench
- **tv**: Test Vector

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
- **6502 Timing States:** 
  - Link: [Visual6502wiki - 6502 Timing States](https://www.nesdev.org/wiki/Visual6502wiki/6502_Timing_States)
- **Hanson's Block Diagram:**
  - File: [6502-Block-Diagram.pdf](https://www.nesdev.org/wiki/Visual6502wiki/Hanson's_Block_Diagram)
- **Visual Transistor-level Simulation of the 6502 CPU:**
  - Link: [Visual Transistor-level Simulation of the 6502 CPU](http://www.visual6502.org)
- **6502 Simulation Repository:**
  - Repository: [6502sim](https://github.com/klynch71/6502sim)
