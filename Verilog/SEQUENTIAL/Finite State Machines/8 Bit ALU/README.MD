
# 🧮 8-bit ALU (Arithmetic Logic Unit)

This module implements a versatile **8-bit Arithmetic Logic Unit (ALU)** capable of performing common arithmetic and logical operations selected via a 4-bit control signal. It includes flag outputs for **carry**, **zero**, and **overflow** to aid in downstream decision-making. The design is straightforward, synthesizable, and suitable for beginner learning and experimentation.

---

## 🔧 Design Files

| Filename        | Description                            |
|-----------------|--------------------------------------|
| `alu_8bit.v`    | Main ALU module implementing ops     |
| `alu_8bit_tb.v` | Testbench verifying ALU functionality |

---

## 🧠 Concept

### Supported Operations (via 4-bit `sel` opcode):

| sel    | Operation       | Description                    |
|--------|-----------------|-------------------------------|
| 0000   | A + B           | Unsigned addition             |
| 0001   | A - B           | Unsigned subtraction          |
| 0010   | A & B           | Bitwise AND                   |
| 0011   | A \| B          | Bitwise OR                    |
| 0100   | A ^ B           | Bitwise XOR                   |
| 0101   | ~A              | Bitwise NOT (operand A only)  |
| 0110   | A << 1          | Logical left shift            |
| 0111   | A >> 1          | Logical right shift           |

### Flags

- **carry_out** — Set on arithmetic carry or borrow  
- **zero** — Set if ALU output is zero  
- **overflow** — Detects signed overflow in addition/subtraction operations  

---

## 🧪 Testbench Overview

The testbench cycles through various operand inputs and operation codes, displaying the output and flag statuses on the console for verification. This enables checking the correctness of arithmetic and logical results and the flag computations.

---

## 🚀 Simulation Instructions

Compile and simulate with your preferred Verilog simulator (e.g., Icarus Verilog):

```bash
iverilog -o alu_sim alu_8bit.v alu_8bit_tb.v
vvp alu_sim
