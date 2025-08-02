# 🔧 From Verilog Code to Bitstream in Vivado

This guide walks you through the **entire Vivado flow** — from writing Verilog code to generating a **.bit** file for FPGA programming.

---

## 🧠 Prerequisites

- **Vivado 2020.2+** installed  
  🔗 [Download Vivado WebPACK (free)](https://www.xilinx.com/support/download.html)
- A basic RTL design (Verilog + testbench)
- Optional: A supported FPGA board (e.g. Nexys A7, ZedBoard)

---

---

## 🚀 STEP 1: Launch Vivado

1. Open **Vivado** from the Start Menu.
2. Click **Create Project**.

---

## 📦 STEP 2: Create a New Vivado Project

### 📌 1. Project Name & Location
- Name: `half_adder_proj` (or similar)
- Location: Any clean folder path

### 📌 2. Project Type
- Select: **RTL Project**
- ✅ Check: *“Do not specify sources at this time”*

### 📌 3. Add Sources
Later. We'll add `.v` files manually.

### 📌 4. Add Constraints
Skip for now (add later during bitstream generation).

### 📌 5. Default Part / Board
- Choose your target board/FPGA:
  - Example FPGA part: `xc7a100tcsg324-1`
  - Or select board like `Nexys A7-100T` (if you’ve board files installed)

---

## 📄 STEP 3: Add Verilog Design & Testbench

### 📌 Add Sources
1. Go to **Flow Navigator → Project Manager → Add Sources**
2. Choose **Add or Create Design Sources**
3. Add your `.v` file (e.g., `half_adder.v`)
4. Then **Add Simulation Sources**
   - Add `half_adder_tb.v` as testbench

---

## 🧪 STEP 4: Run Behavioral Simulation (Optional)

> Useful to validate the RTL before synthesis.

1. Go to **Flow Navigator → Simulation → Run Simulation → Run Behavioral Simulation**
2. Check the **Waveform Viewer**:
   - You should see signals toggle as per the testbench
   - If not, add delays (`#10;`) and `$finish;` in the testbench

#### Example Simulation Code Snippet
```verilog
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, half_adder_tb);
  ...
  #100;
  $finish;
end
```

---

## 🔧 STEP 5: Add Constraints (.xdc)

To generate a bitstream for a board, you **must map ports to physical FPGA pins** using a `.xdc` file.

### 📌 Add Constraints
1. Go to **Add Sources → Add or Create Constraints**
2. Add your board’s `.xdc` file:
   - For Nexys A7: Use `Nexys-A7-Master.xdc`
3. Edit the `.xdc` to match your design's I/Os:
```tcl
## Clock Signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Switches
set_property PACKAGE_PIN V17 [get_ports a]
set_property IOSTANDARD LVCMOS33 [get_ports a]

## LEDs
set_property PACKAGE_PIN U16 [get_ports sum]
set_property IOSTANDARD LVCMOS33 [get_ports sum]
```

---

## 🔄 STEP 6: Synthesis

1. In **Flow Navigator**, click **Run Synthesis**
2. Wait until it's done.
3. Click **Open Synthesized Design** when prompted.

---

## 📐 STEP 7: Implementation

1. Click **Run Implementation**
2. This step places and routes the logic inside the FPGA fabric
3. Click **Open Implemented Design** when done

---

## 📦 STEP 8: Bitstream Generation

1. Click **Generate Bitstream**
2. This will create `.bit` and `.bin` files
   - Location: `project_name/project_name.runs/impl_1/`

---

## 🔌 STEP 9: FPGA Programming (Optional)

To load your design onto an actual FPGA board:

1. Connect your board via USB
2. Click **Open Hardware Manager**
3. Click **Auto Connect**
4. Click **Program Device**
5. Browse and select the `.bit` file
6. Click **Program**

You should now see the design running on your board (e.g., LEDs blinking, counters counting).

---

## 🧹 STEP 10: Cleaning and Git Ignore

Avoid pushing large Vivado temp folders:
```
*.jou
*.log
*.str
*.xpr.lock
.cache/
.hw/
.runs/
.sim/
.gen/
.ip_user_files/
webtalk/
```

Put this in your `.gitignore`.

---

## 🧰 Pro Tips

- Always simulate before synthesis
- Add clock constraints for faster timing closure
- Use Netlist viewer and timing reports to understand design delays
- You can generate schematics after synthesis via **Tools → Schematic**

---

## ❓ FAQ

**Q: My `.bit` file isn’t generated?**  
✅ Check for critical warnings or errors in synthesis or implementation. Also confirm `.xdc` pins match your module port names.

**Q: I get timing violations?**  
✅ You may need to:
- Add proper timing constraints
- Reduce logic depth
- Increase clock period

**Q: Can I use SystemVerilog?**  
✅ Yes, but you must enable SystemVerilog in Vivado project settings → Simulation → Verilog options.

---

## 🧠 Summary Flowchart

```text
Write Verilog → Create Vivado Project → Add Sources
        ↓
   (Optional) Simulate → Add Constraints (.xdc)
        ↓
     Run Synthesis → Run Implementation
        ↓
     Generate Bitstream → Program FPGA
```

---

## 📬 Need Help?

Open an [issue](https://github.com/AVM-27/RTL-for-Kids/issues) or ping your waveform screenshot for help.

Happy FPGA'ing! 🚀

---
