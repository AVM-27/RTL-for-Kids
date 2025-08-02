
# 🔌 Basic Logic Gates in Verilog

This section contains synthesizable Verilog modules and testbenches for **fundamental logic gates**, serving as the building blocks of digital design. Ideal for absolute beginners, each gate is implemented with minimal code, beginner-friendly comments, and verified using simple testbenches.

---

## 🧱 Included Gates

| Gate        | Filename             | Description                        |
|-------------|----------------------|------------------------------------|
| AND         | `and_gate.v`         | 2-input AND gate                   |
| OR          | `or_gate.v`          | 2-input OR gate                    |
| NOT         | `not_gate.v`         | 1-input inverter                   |
| NAND        | `nand_gate.v`        | 2-input NAND gate                  |
| NOR         | `nor_gate.v`         | 2-input NOR gate                   |
| XOR         | `xor_gate.v`         | 2-input XOR gate                   |
| XNOR        | `xnor_gate.v`        | 2-input XNOR gate                  |

Each module is paired with its own testbench:
- `*_tb.v` format (e.g., `and_gate_tb.v`)
- Uses `$monitor` for waveform-less debugging
- Covers all input combinations

---

## 🧠 Concept Overview

Logic gates are fundamental circuits that process binary inputs to produce binary outputs using Boolean logic.

| Gate  | Function        | Boolean Equation    |
|-------|------------------|---------------------|
| AND   | High only if all inputs are high | A · B        |
| OR    | High if at least one input is high | A + B        |
| NOT   | Inverts input     | ~A               |
| NAND  | Opposite of AND   | ~(A · B)         |
| NOR   | Opposite of OR    | ~(A + B)         |
| XOR   | High if inputs differ | A ⊕ B         |
| XNOR  | High if inputs match  | ~(A ⊕ B)       |

All modules are behavioural-level for easy comprehension and are simulation-ready.

---

## 🧪 Running the Simulations

Use any simulator like **Icarus Verilog**, **ModelSim**, or **Vivado**. For example, with Icarus:

```bash
iverilog -o and_sim and_gate.v and_gate_tb.v
vvp and_sim
