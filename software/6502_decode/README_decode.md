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
| JSR          | "100000"             |
| abs          | "100001"             |
| RTI          | "100010"             |
| RTS          | "100011"             |
| PHP          | "100100"             |
| PLP          | "100101"             |
| PHA          | "100110"             |
| PLA          | "100111"             |
| DEY          | "101000"             |
| TAY          | "101001"             |
| INY          | "101010"             |
| INX          | "101011"             |
| CLC          | "101100"             |
| SEC          | "101101"             |
| CLI          | "101110"             |
| SEI          | "101111"             |
| TYA          | "110000"             |
| CLV          | "110001"             |
| CLD          | "110010"             |
| SED          | "110011"             |
| TXA          | "110100"             |
| TXS          | "110101"             |
| TAX          | "110110"             |
| TSX          | "110111"             |
| DEX          | "111000"             |
| NOP          | "111001"             |

## Addressing Modes for 6502 Instructions

In the context of 6502 instructions, different addressing modes determine how the operands of an instruction are specified. Here are the addressing modes along with the associated values for `register_select` and `addressing_mode`:

| Addressing Mode  | `register_select` | `addressing_mode` |
|-------------------|-------------------|-------------------|
| Accumulator       | "0"               | "000"             |
| Absolute          | "0"               | "001"             |
| Absolute, X       | "0"               | "001"             |
| Absolute, Y       | "1"               | "001"             |
| Immediate         | No need           | "010"             |
| Implied           | No need           | "011"             |
| Indirect          | "0"               | "100"             |
| X, Indirect       | "0"               | "100"             |
| Indirect, Y       | "1"               | "101"             |
| Relative          | No need           | "110"             |
| Zero page         | "0"               | "111"             |
| Zero page, X      | "0"               | "111"             |
| Zero page, Y      | "1"               | "111"             |

Reference: [6502 Addressing Modes Wiki](https://wiki.cdot.senecacollege.ca/wiki/6502_Addressing_Modes).
