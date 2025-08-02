# 🧠 RTL-for-Kids

A beginner-friendly digital design lab for learning Verilog, one module at a time.

This repository contains logically verified, simulation-tested, and GitHub-ready Verilog modules and testbenches—organised by topic and built to be understandable by students, hobbyists, and future hardware engineers.

> 🛠️ If you’ve ever felt lost staring at a waveform, this repo is for you.

---

## 📂 Folder Structure

```
RTL-for-Kids/
├── Verilog/                    # Core learning modules
│   ├── Basic Gates/           # AND, OR, NOT, XOR, etc.
│   ├── COMBINATIONAL/         # Adders, Subtractors, MUX, DECODER...
│   ├── SEQUENTIAL/            # Flip-Flops, Counters, Shift Registers, FSMs
│   └── README.md              # Category-specific documentation
├── Xilinx Vivado Implementations/  # Full Vivado project folders (.xpr)
├── LICENSE
└── README.md                  # This file
```

---

## 🧱 What’s Inside?

- ✅ **Beginner-Focused Code**: All modules include inline comments to explain *what* and *why*.
- 🧪 **Testbenches Included**: Each design has a testbench for simulation and waveform analysis.
- 🧠 **Structured by Topic**: Flip-flops, FSMs, Shift Registers, Adders, MUX, and more.
- 🎓 **Vivado Projects**: Pre-built projects with `.xpr` files for hands-on synthesis or implementation.

---

## 🧰 How to Use

### ⏯️ Simulate Verilog Code
You can simulate most modules using any simulator like:
- **Icarus Verilog** + GTKWave
- **ModelSim** / Questa
- **Vivado Simulator**

Example with Icarus:
```sh
iverilog -o full_adder_tb full_adder.v full_adder_tb.v
vvp full_adder_tb
```

### 🛠️ Open in Vivado
1. Go to `Xilinx Vivado Implementations/`
2. Open any `.xpr` file with Vivado 2020.2+  
3. Run simulation or implementation.

---

## 🧑‍💻 Who Is This For?

- 💡 ECE/EEE students learning Verilog
- 🔧 Hobbyists building hardware logic
- 🧪 Professors looking for simulation-ready labs
- 👩‍🏫 Peer mentors and coding club curators

---

## 📝 Contributing

Pull requests for new designs, better testbenches, or beginner explanations are welcome!  
Please keep naming, file format, and folder structure consistent. Open an issue if unsure.

---

## 📜 License

This repository is licensed under the MIT License.  
See the [LICENSE](./LICENSE) file for details.

---

## 🔗 GitHub

https://github.com/AVM-27/RTL-for-Kids
