
# ➕ Combinational Circuits – Arithmetic and Dataflow in Verilog

This section of the `RTL-for-Kids` repository includes beginner-friendly Verilog implementations of foundational **combinational logic circuits**. These include **arithmetic units** (adders, subtractors), **data selectors** (MUX), **data encoders/decoders**, and **comparators**. Each circuit is testbench-verified, fully modular, and documented with internal comments to help new learners understand how digital logic works at the gate level and structural level.

---

## 🔧 Circuit Index

| 🔹 Circuit                          | 🔧 File Name                   | 🧠 Description |
|------------------------------------|-------------------------------|----------------|
| Half Adder                         | `half_adder.v`                | Adds 2 single-bit inputs (A, B) and produces Sum and Carry outputs |
| Full Adder                         | `full_adder.v`                | Adds 3 bits (A, B, Cin), outputs Sum and Cout using chained logic |
| Half Subtractor                    | `half_subtractor.v`           | Subtracts B from A, gives Difference and Borrow |
| Full Subtractor                    | `full_subtractor.v`           | Subtracts with Borrow-in; outputs Difference and Borrow-out |
| Ripple Carry Adder (4-bit)         | `ripple_carry_adder4.v`       | Chains 4 full adders; carry ripples through bits |
| Adder/Subtractor using MUX (4-bit) | `adder_subtractor4.v`         | Selects between addition and subtraction using XOR + MUX |
| Carry Lookahead Adder (4-bit)      | `cla4.v`                      | High-speed 4-bit adder using generate and propagate logic |
| Comparator (4-bit)                 | `comparator_4bit.v`           | Compares two 4-bit numbers (A, B); outputs equal, greater, less |
| Decoder (4x16, Structural)         | `decoder4x16_struct.v`        | Converts 4-bit input to one-hot 16-bit output using gates |
| Priority Encoder (8x3)             | `priority_encoder8x3.v`       | Encodes highest-priority '1' bit among 8 inputs into 3-bit code |
| Multiplexer (16x1, Structural)     | `mux16x1_struct.v`            | Selects one of 16 inputs based on 4-bit selector input |

---

## 🧪 Testbenches

Each module includes a testbench named `*_tb.v` that:

- Covers all critical input combinations
- Uses `$display`/`$monitor` for easy waveform-less debugging
- Can be run with `iverilog` or simulated in GTKWave
- Demonstrates correct outputs for standard cases and edge cases

---

## 🧠 Learning Goals

These circuits will help you:

- Understand **bitwise logic**, **binary arithmetic**, and **signal flow**
- Learn **hierarchical module composition** (e.g., full adder from half adders)
- Apply **gate-level structural modelling**
- Grasp speed trade-offs (e.g., RCA vs CLA)
- Build functional understanding of how CPUs and ALUs perform computation

---

## 🏁 Simulation Instructions

To compile and simulate any module + testbench pair using Icarus Verilog:

```bash
iverilog -o sim cla4.v cla4_tb.v     # Replace cla4 with desired circuit
vvp sim
