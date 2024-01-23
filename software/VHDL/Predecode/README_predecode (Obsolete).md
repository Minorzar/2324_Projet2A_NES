# NES 2A03 Processor Instructions

The NES 2A03 processor is a variant of the 6502 used in the Nintendo Entertainment System (NES). Here is a list of instructions and addressing modes supported by the 2A03 processor:

## Opcodes and Instructions

For each opcode/instruction, we have assigned a unique value to `active_instruction`, maintaining a consistent number of bits.

These values were assigned for the creation of `decode.vhdl` and are not official.

| Instruction  | `active_instruction` |
|--------------|----------------------|
| ORA          | "000000"             |
| AND          | "000001"             |
| EOR          | "000010"             |
| ADC          | "000011"             |
| STA          | "000100"             |
| LDA          | "000101"             |
| CMP          | "000110"             |
| SBC          | "000111"             |
| ASL          | "001000"             |
| ROL          | "001001"             |
| LSR          | "001010"             |
| ROR          | "001011"             |
| STX          | "001100"             |
| LDX          | "001101"             |
| DEC          | "001110"             |
| INC          | "001111"             |
| BIT          | "010000"             |
| JMP          | "010001"             |
| JMP(ABS)     | "010010"             |
| STY          | "010011"             |
| LDY          | "010100"             |
| CPY          | "010101"             |
| CPX          | "010110"             |
| BPL          | "010111"             |
| BMI          | "011000"             |
| BVC          | "011001"             |
| BVS          | "011010"             |
| BCC          | "011011"             |
| BCS          | "011100"             |
| BNE          | "011101"             |
| BEQ          | "011110"             |
| BRK          | "011111"             |
| JSR abs      | "100000"             |
| RTI          | "100001"             |
| RTS          | "100010"             |
| PHP          | "100011"             |
| PLP          | "100100"             |
| PHA          | "100101"             |
| PLA          | "100110"             |
| DEY          | "100111"             |
| TAY          | "101000"             |
| INY          | "101001"             |
| INX          | "101010"             |
| CLC          | "101011"             |
| SEC          | "101100"             |
| CLI          | "101101"             |
| SEI          | "101110"             |
| TYA          | "101111"             |
| CLV          | "110000"             |
| CLD          | "110001"             |
| SED          | "110010"             |
| TXA          | "110011"             |
| TXS          | "110100"             |
| TAX          | "110101"             |
| TSX          | "110110"             |
| DEX          | "110111"             |
| NOP          | "111000"             |

## Addressing Modes for 6502 Instructions

In the context of 6502 instructions, different addressing modes determine how the operands of an instruction are specified. Here are the addressing modes along with the associated values for `addressing_mode` and `register_select`:

| Addressing Mode   | `addressing_mode` | `register_select` |
|-------------------|-------------------|-------------------|
| Accumulator       | "000"             | "00"              |
| Absolute          | "001"             | "00"              |
| Absolute, X       | "001"             | "01"              |
| Absolute, Y       | "001"             | "10"              |
| Immediate         | "010"             | "00"              |
| Implied           | "011"             | "00"              |
| Indirect          | "100"             | "00"              |
| X, Indirect       | "100"             | "01"              |
| Indirect, Y       | "101"             | "10"              |
| Relative          | "110"             | "00"              |
| Zero page         | "111"             | "00"              |
| Zero page, X      | "111"             | "01"              |
| Zero page, Y      | "111"             | "10"              |

**Note on `register_select`:**
- "00" refers to the selection of the accumulator.
- "01" refers to the selection of the X register.
- "10" refers to the selection of the Y register.

## Additional Components

### Predecode Register:

- **VHDL File:** `predecode.vhdl`
- **Functionality:** The predecode register holds the raw instruction input and is responsible for extracting relevant fields like `cc`, `aaa`, `bbb`, `xx`, and `y` from the instruction.

### Predecode Logic:

- **VHDL File:** `predecode.vhdl`
- **Functionality:** The predecode logic interprets the fields extracted by the predecode register to determine the `active_instruction`, `addressing_mode`, and `register_select`. It acts as an intermediate stage between the raw instruction and the subsequent processing stages.

### Instruction Register:

- **VHDL File:** `instruction_register.vhdl`
- **Functionality:** The instruction register holds the processed instruction and makes it available for other components. It plays a role in the instruction fetch phase.

### Timing Generation Logic:

- **VHDL File:** `timing_generation_logic.vhdl`
- **Functionality:** The timing generation logic is responsible for generating timing signals that coordinate the execution of instructions. It helps synchronize the activities of different components and ensures proper sequencing of operations.

### Decode ROM:

- **VHDL File:** `decode.vhdl`
- **Functionality:** The decode ROM (Read-Only Memory) takes the `active_instruction` as input and outputs control signals that direct the behavior of the processor during the execution of the corresponding instruction. It essentially translates instruction codes into actionable signals for the processor.

### Random Control Logic:

- **VHDL File:** `random_control_logic.vhdl`
- **Functionality:** The random control logic is responsible for generating control signals based on specific conditions or events within the processor. It may handle various control aspects, such as branching conditions, interrupts, or other non-deterministic behaviors.

## References

- [The 6502/65C02/65C816 Instruction Set Decoded](https://llx.com/Neil/a2/opcodes.html)
- [6502 Addressing Modes Wiki](https://wiki.cdot.senecacollege.ca/wiki/6502_Addressing_Modes)
