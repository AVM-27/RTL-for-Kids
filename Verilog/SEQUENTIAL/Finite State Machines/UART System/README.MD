# 🛰️ Full UART (TX + RX) using FSM in Verilog

This module implements a **universal asynchronous receiver transmitter (UART)** using **two separate Finite State Machines (FSMs)**—one for transmission and one for reception. The design is beginner-friendly, testbench-verified, and simulates loopback communication by connecting `tx` directly to `rx`.

---

## 🔧 Design Files

| Filename            | Description                      |
|---------------------|----------------------------------|
| `uart_full.v`       | Top module connecting TX and RX  |
| `uart_tx_fsm.v`     | Transmit FSM module              |
| `uart_rx_fsm.v`     | Receive FSM module               |
| `uart_full_tb.v`    | Testbench with internal loopback |

---

## 🧠 Concept

### UART Protocol
- **1 Start Bit** (low)
- **8 Data Bits** (LSB first)
- **1 Stop Bit** (high)

No parity. No flow control. Asynchronous — relies on agreed baud rate.

### Baud Rate Logic
The FSM waits for `BAUD_DIV` clock cycles to sample or transmit each bit.  
For example, at 10 MHz clock and 9600 bps baud:
