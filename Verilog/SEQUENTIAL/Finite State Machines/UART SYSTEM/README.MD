# 🛰️ UART (Universal Asynchronous Receiver/Transmitter)

This directory contains Verilog implementations of UART Transmitter and Receiver modules using Finite State Machines (FSMs). The goal is to demonstrate clear FSM-based design principles for asynchronous serial communication, tailored for beginner to intermediate learners.

---

## 📦 Folder Structure

```
UART/
├── uart_tx_fsm.v
├── uart_tx_fsm_tb.v
├── uart_rx_fsm.v
├── uart_rx_fsm_tb.v
└── README.md
```

---

## 🔧 UART TX FSM

- **Function:** Transmits an 8-bit data word serially with a start bit (`0`) and a stop bit (`1`) at a user-specified baud rate.
- **FSM States:**
  - `IDLE`: Waits for `tx_start` to begin transmission.
  - `START`: Sends a start bit (`0`).
  - `DATA`: Shifts out 8 bits of data (`LSB` first).
  - `STOP`: Sends a stop bit (`1`) and goes back to `IDLE`.

**Key Signals:**
- `tx_start`: Triggers transmission.
- `tx_data`: 8-bit data to be sent.
- `tx`: Serial output.
- `tx_busy`: Indicates ongoing transmission.

---

## 🛰️ UART RX FSM

- **Function:** Receives 8-bit serial data framed by a start and stop bit.
- **FSM States:**
  - `IDLE`: Waits for falling edge (start bit).
  - `START`: Validates start bit midpoint.
  - `DATA`: Captures each bit at the centre of its expected bit-time.
  - `STOP`: Validates stop bit, asserts `rx_done`.

**Key Signals:**
- `rx`: Serial input.
- `rx_data`: 8-bit parallel output.
- `rx_done`: Signals valid data reception.

---

## ⚙️ Configuration

| Parameter | Description                | Value         |
|----------|----------------------------|---------------|
| `CLK_FREQ` | Clock frequency            | 50_000_000 Hz |
| `BAUD_RATE`| UART baud rate             | 9600          |

---

## 🧪 Testbenches

Both `uart_tx_fsm_tb.v` and `uart_rx_fsm_tb.v` simulate transmission and reception of a byte. Use these to verify timing alignment, correct state transitions, and proper data framing.

---

## 🧠 Notes

- Designed using Mealy-style FSMs for tighter control over output timing.
- Bit sampling in RX is centre-aligned using a tick counter for robustness.
- Can be extended with parity, multiple stop bits, or configurable frame size.

---

> GitHub: [https://github.com/AVM-27](https://github.com/AVM-27)  
> Author: Adarsh Venugopal  
> Created On: 2025-08-02  
