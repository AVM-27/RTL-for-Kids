# 🧠 UART Receiver (FSM-based)

This module implements a UART Receiver using a **Finite State Machine (FSM)** approach. It samples incoming serial data at a configured baud rate (e.g. 9600) and reconstructs an 8-bit parallel output once a complete frame (start bit + 8 data bits + stop bit) is received.

---

## 📦 File Structure

```
RTL-for-Kids/
└── Verilog/
    └── SEQUENTIAL/
        └── Finite State Machines/
            └── UART RX FSM/
                ├── uart_rx.v         # FSM-based UART receiver module
                ├── uart_rx_tb.v      # Testbench for UART receiver
                └── README.md         # You are here
```

---

## 🧠 How It Works

### UART Protocol Recap:
- **Start Bit**: 1 bit (Low)
- **Data Bits**: 8 bits (LSB first)
- **Stop Bit**: 1 bit (High)
- **No parity used**

### FSM States:
| State   | Description                                  |
|---------|----------------------------------------------|
| IDLE    | Waits for a falling edge (start bit = 0)     |
| START   | Waits for half-bit time to centre sample     |
| DATA    | Captures 8 serial bits into shift register   |
| STOP    | Verifies stop bit (1)                        |
| DONE    | Signals `rx_done = 1`, moves to IDLE         |

### Internal Mechanism:
- System clock is assumed to be **100 MHz**
- Baud rate = 9600 → **1 bit = 10416 clocks**
- A counter waits for these clock cycles per bit sample
- Shift register stores serial bits → outputs parallel byte

---

## 🧪 Simulation Output (Example)

```
Time=1058400 | rx_done=1 | rx_data=0xA5
Time=3158400 | rx_done=1 | rx_data=0x3C
```

---

## 🛠️ Parameters

You can customise the baud rate by changing this line:

```verilog
parameter CLKS_PER_BIT = 10416;  // 9600 baud @ 100MHz
```

To support 115200 baud: `CLKS_PER_BIT = 868`

---

## ✅ Features

- Full 8-bit UART Receiver
- FSM-driven design (Moore-style)
- Accurate mid-bit sampling
- Testbench with custom UART transmit simulation

---

## ✍️ Author

- **Adarsh Venugopal**  
  GitHub: [AVM-27](https://github.com/AVM-27)

---
