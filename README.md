# 🧠 RTL-for-Kids

A beginner-friendly, fully open-source digital design lab built around **learning Verilog through simulation**. This repository breaks down complex hardware concepts into **bite-sized, logically verified modules**—from logic gates to FSM-based UART systems—complete with **clean code, testbenches, comments, and documentation**.

> 🚀 Perfect for ECE students, digital logic educators, FPGA beginners, and anyone who thinks RTL is rocket science (it’s not).

---

## 📦 What’s Inside?

- ✅ **Verilog Modules**: Combinational, sequential, arithmetic, FSM-based designs.
- 🧪 **Testbenches**: Every module includes a working simulation testbench.
- 📚 **Beginner Comments**: In-code explanations for each line and signal.
- 🧰 **Vivado Projects**: Several modules synthesised and implemented in Vivado (including `.xpr` projects).
- 📁 **Structured Repository**: Clean directory layout by topic and function.
- 💡 **Educational Value**: Designed for use in college labs, peer teaching, or self-learning.

---

## 📂 Directory Overview

```
RTL-for-Kids/
├── Verilog/                    # Verilog source code (all modules & testbenches)
│   ├── Basic Gates/           # AND, OR, XOR, etc.
│   ├── COMBINATIONAL/         # Adders, MUXes, Encoders, Comparators...
│   ├── SEQUENTIAL/            # Flip-Flops, Counters, Shift Registers, FSMs
│   └── README.md              # Category-wise documentation
├── Xilinx Vivado Implementations/  # Vivado .xpr projects and synth results
├── LICENSE                    # MIT License
└── README.md                  # You’re reading it now
```

Each Verilog subfolder contains:
- One or more RTL design files (`.v`)
- Their corresponding testbenches (`_tb.v`)
- A markdown `README.md` explaining theory + simulation instructions

---

## 🔬 Simulation Guide

### 1. 📥 Prerequisites
To simulate the designs, install one of:
- [Icarus Verilog](https://steveicarus.github.io/iverilog/) + GTKWave
- ModelSim or Questa
- Vivado's built-in simulator

---

### 2. ▶️ Run a Simulation (Example)

```bash
# Step 1: Compile the module and testbench
iverilog -o full_adder_tb full_adder.v full_adder_tb.v

# Step 2: Run the compiled binary
vvp full_adder_tb

# Step 3: View waveform (optional)
gtkwave dump.vcd
```

Each testbench uses `$dumpfile`, `$dumpvars`, and `$display` for waveform and output verification.

---

## 🛠️ Vivado Projects

The `Xilinx Vivado Implementations/` folder contains:
- ✅ Complete `.xpr` project files
- ✅ Synthesised RTL designs
- ✅ IP cores and constraint folders (if needed)

> 🔒 *To keep the repo lean, auto-generated Vivado folders like `.runs/`, `.cache/`, etc. are excluded using `.gitignore`.*

Open `.xpr` in Vivado 2020.2+ and launch simulation or synthesis directly.

---

## 🎓 Who Is This For?

- 🧑‍🎓 **Students** learning Verilog and digital logic
- 👩‍🏫 **Educators** creating lab material
- 👨‍🔧 **Tinkerers** building logic on boards
- 🤝 **Peers** mentoring juniors or friends
- 🧠 **You** if you've ever asked "What even is a Flip-Flop?"

---

## ✍️ Contributing

We welcome:
- New modules and designs
- Better testbenches and waveform analysis
- Fixes for simulation bugs or bad logic
- More beginner-friendly inline explanations
- README improvements and Vivado tips

**Contribution Guidelines**:
- Stick to existing file/folder naming style
- Use `_tb.v` suffix for testbenches
- Use `//` inline comments to explain every line
- Avoid uploading `.runs/`, `.cache/`, `.sim/` or `.hw/` folders

> Open an issue if you're unsure, or just fork and PR!

---

## 🧪 Sample Learning Path (Suggested)

Start with:
1. **Basic Gates** ➝
2. **Half & Full Adders/Subtractors** ➝
3. **MUX/DECODER/ENCODER** ➝
4. **Ripple Carry and CLA** ➝
5. **Flip-Flops (D, T, JK, SR)** ➝
6. **Counters & Shift Registers** ➝
7. **Sequence Detectors & FSMs** ➝
8. **UART TX/RX & 8-bit ALU**

Each folder follows a structured format so you can progress at your own pace.

---

## 📜 License

This repo is licensed under the **MIT License**.  
You're free to use, modify, remix, and redistribute with attribution.

> 📄 See the [LICENSE](./LICENSE) file for details.

---

## 🔗 GitHub

[👉 AVM-27/RTL-for-Kids](https://github.com/AVM-27/RTL-for-Kids)

Give the repo a ⭐ if it helped you!

---
