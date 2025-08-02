# 📡 UART TX FSM – RTL-for-Kids

**UART Transmitter** implemented using a Finite State Machine (FSM) in Verilog. This design serially transmits an 8-bit parallel input with UART framing: 1 start bit, 8 data bits (LSB first), and 1 stop bit. Built for the `RTL-for-Kids` series to help beginners understand UART TX logic with state machines.

---

## 📂 File Structure

```
RTL-for-Kids/
└── Verilog/
    └── SEQUENTIAL/
        └── Finite State Machines/
            └── UART TX FSM/
                ├── uart_tx.v         # FSM-based UART Transmitter
                ├── uart_tx_tb.v      # Testbench
                └── README.md         # This file
```

---

## 🔧 Module Features

- FSM with four states: `IDLE`, `START`, `DATA`, `STOP`
- Sends start bit (0), 8 data bits, and stop bit (1)
- Accepts `tx_start` pulse to begin transmission
- Indicates ongoing transmission via `tx_busy`
- Single-wire output (`tx`) compatible with UART receivers

---

## 🧠 FSM Operation

| **State** | **Action**                                 |
|-----------|---------------------------------------------|
| `IDLE`    | Waits for `tx_start = 1`                    |
| `START`   | Sends a start bit (`0`)                     |
| `DATA`    | Sends 8-bit `tx_data`, LSB first            |
| `STOP`    | Sends a stop bit (`1`), returns to `IDLE`   |

---

## 🧬 I/O Ports

| **Signal**  | **Direction** | **Width** | **Purpose**                              |
|-------------|---------------|-----------|------------------------------------------|
| `clk`       | Input         | 1-bit     | System clock                             |
| `reset`     | Input         | 1-bit     | Active-high synchronous reset            |
| `tx_start`  | Input         | 1-bit     | Start signal to begin transmission       |
| `tx_data`   | Input         | 8-bit     | Data to be transmitted                   |
| `tx`        | Output        | 1-bit     | UART serial output                       |
| `tx_busy`   | Output        | 1-bit     | High while data is being transmitted     |

---

## ⌛ Timing & Baud Simulation

- The internal counter delays state transitions to mimic **UART baud rate** (e.g., 9600 bps).
- The `BAUD_DIV` constant can be adjusted to match real-world timing.
- For example, a 100 MHz clock with `BAUD_DIV = 10416` yields ~9600 baud.

---

## 🧪 Testbench (`uart_tx_tb.v`)

- Provides sample bytes (e.g., `0xA5`, `0x3C`)
- Pulses `tx_start` and waits for `tx_busy` to deassert
- Monitors `tx` line to confirm bit-accurate UART sequence

---

## 🚀 How to Run

1. Open `uart_tx.v` and `uart_tx_tb.v` in any simulator (Vivado, ModelSim, etc.)
2. Compile and simulate
3. Observe:
   - TX waveform on serial line (`tx`)
   - Timing of start, data, and stop bits
   - Behaviour of FSM and state transitions

---

## 🧠 Learning Goals

- Understand how UART transmission works at the bit level
- Learn FSM design with real-world timing constraints
- Bridge Verilog FSM concepts with peripheral control

---

## 🧵 Related Topics

- UART Receiver FSM
- Baud rate generators
- Bit-sampling and framing in asynchronous serial comm

---

**🔗 GitHub:** [AVM-27](https://github.com/AVM-27) • Author: Adarsh Venugopal • Created: 2025-08-02
