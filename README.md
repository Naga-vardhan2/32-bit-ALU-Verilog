# 32-bit Arithmetic and Logic Unit (ALU) Using Verilog

## Project Overview
This project implements a 32-bit Arithmetic and Logic Unit (ALU) using Verilog HDL.

## Supported Operations

| Opcode | Operation | Function |
|--------|-----------|----------|
| 0000 | Addition | A + B |
| 0001 | Subtraction | A - B |
| 0010 | AND | A & B |
| 0011 | OR | A | B |
| 0100 | XOR | A ^ B |
| 0101 | NOT | ~A |
| 0110 | Logical Left Shift | A << 1 |
| 0111 | Logical Right Shift | A >> 1 |

## Files
- `rtl/alu_32bit.v` - Main synthesizable ALU module
- `testbench/alu_32bit_tb.v` - Testbench for functional verification
- `docs/` - Project report/documentation
- `simulation/` - Simulation waveform/output files

## Simulation
The design can be simulated using Cadence Xcelium/NC-Sim, QuestaSim/ModelSim, or another Verilog simulator.

### Example with Icarus Verilog
```bash
iverilog -o alu_sim rtl/alu_32bit.v testbench/alu_32bit_tb.v
vvp alu_sim
```

The testbench also generates `alu_32bit.vcd`, which can be viewed using GTKWave.

## Outputs
- 32-bit `result`
- `carry` flag for addition
- `zero` flag when the result is zero

## Author
Bedada Aditya
