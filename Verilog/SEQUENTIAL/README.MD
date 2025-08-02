# 🔁 Sequential Circuits – RTL-for-Kids

This section of the **RTL-for-Kids** repository includes fully synthesizable, logically verified, and beginner-annotated Verilog modules and testbenches for core **sequential digital circuits**.

From flip-flops to counters and shift registers, each design is structured to build strong foundational intuition through simulation.

---

## ✅ Included Modules

### 🧿 Flip-Flops

| Module            | Description                            |
|-------------------|----------------------------------------|
| `d_flip_flop.v`   | Level-sensitive D flip-flop            |
| `t_flip_flop.v`   | T flip-flop (toggles on T=1)           |
| `sr_flip_flop.v`  | SR flip-flop with invalid condition    |
| `jk_flip_flop.v`  | JK flip-flop with full truth table     |

Each flip-flop includes a simple clocked logic and is ideal for triggering state changes in synchronous designs.

---

### 🔄 Counters

| Module                   | Description                          |
|--------------------------|--------------------------------------|
| `counter_2bit.v`         | Basic 2-bit up counter               |
| `updown_counter_2bit.v`  | 2-bit up/down counter with control   |
| `mod6_counter.v`         | MOD-6 synchronous counter            |
| `ring_counter_4bit.v`    | 4-bit ring counter with 1-hot encoding |
| `johnson_counter_4bit.v` | 4-bit Johnson (twisted ring) counter |

All counters operate on the rising edge of the clock and are resettable. Useful for sequence generation, timers, and FSM indexing.

---

### 📤 Shift Registers

| Module                  | Description                             |
|-------------------------|-----------------------------------------|
| `sipo_shift_register.v` | Serial-In Parallel-Out shift register   |
| `piso_shift_register.v` | Parallel-In Serial-Out shift register   |
| `siso_shift_register.v` | Serial-In Serial-Out shift register     |
| `pipo_shift_register.v` | Parallel-In Parallel-Out shift register |

These modules demonstrate different data movement modes in synchronous registers, essential in serial communication and data buffering.

---

### 📦 General Registers

| Module                | Description                         |
|-----------------------|-------------------------------------|
| `pipo_register_4bit.v`| Simple 4-bit parallel register       |

Acts as a basic D flip-flop bank to store 4-bit data, with clocked synchronous behaviour.

---

## 🧪 Simulation Support

- All modules include testbenches named `<module_name>_tb.v`
- Each testbench includes:
  - Clock generation
  - Reset logic
  - Control signal stimulation
  - `$monitor` or waveform triggers

---

## 🚀 How to Simulate (Icarus Verilog)

```bash
iverilog -o sim_out sipo_shift_register.v sipo_shift_register_tb.v
vvp sim_out
```

Use `gtkwave` to open any `.vcd` files generated for waveform visualisation.

---

## 🧠 Learning Outcomes

- Understand state-holding circuits
- Grasp clocked vs combinational design
- Get hands-on with timing, reset, and register control
- Build confidence to design more complex state machines

---

## 👨‍💻 Author

**Adarsh Venugopal**  
ECE, Amrita Vishwa Vidyapeetham  
🔗 GitHub: [AVM-27](https://github.com/AVM-27)

---

For FSM-based sequential designs like UART, traffic light controllers, and sequence detectors, see the dedicated **Finite State Machines** folder.
