# 🛰️ Full UART (TX + RX) using FSM in Verilog

This project implements a complete **Universal Asynchronous Receiver Transmitter (UART)** system using FSMs for both transmitter and receiver logic. It is designed for learning and experimentation and is structured for beginner RTL designers under the `RTL-for-Kids` initiative.

---

## 📂 Folder Structure

```
RTL-for-Kids/
└── Verilog/
    └── SEQUENTIAL/
        └── Finite State Machines/
            └── UART_Full/
                ├── uart_tx_fsm.v
                ├── uart_rx_fsm.v
                ├── uart_full.v
                ├── uart_full_tb.v
                └── README.md
```

---

## 📄 Module Descriptions

| File Name        | Description                               |
|------------------|-------------------------------------------|
| `uart_tx_fsm.v`  | Transmitter FSM for serial data output    |
| `uart_rx_fsm.v`  | Receiver FSM for serial data input        |
| `uart_full.v`    | Top module combining TX and RX FSMs       |
| `uart_full_tb.v` | Testbench with internal loopback          |

---

## ⚙️ UART Protocol Basics

- **Baud Rate**: Defines bit duration. Set using a clock divider (`BAUD_DIV`).
- **Frame Format**:
  - 1 Start Bit (0)
  - 8 Data Bits (LSB first)
  - 1 Stop Bit (1)

Example: To achieve 9600 baud with a 10 MHz system clock:  
`BAUD_DIV = 10_000_000 / 9600 ≈ 1041`

---

## 🔄 TX FSM Working (uart_tx_fsm.v)

- **IDLE**: Wait for `tx_start = 1`.
- **START**: Send start bit (0).
- **DATA**: Send 8 bits (LSB first), one per `BAUD_DIV` cycles.
- **STOP**: Send stop bit (1).
- **DONE**: Assert `tx_done = 1` then return to IDLE.

---

## 🔄 RX FSM Working (uart_rx_fsm.v)

- **IDLE**: Wait for `rx` to go low (start bit).
- **START**: Sample mid-bit to confirm start.
- **DATA**: Sample each data bit every `BAUD_DIV` cycles.
- **STOP**: Wait for stop bit (1).
- **DONE**: Assert `rx_done = 1`, data ready on `rx_data`.

---

## 🧪 Testbench Summary (uart_full_tb.v)

- Connects `tx` output to `rx` input directly (loopback).
- Sends `0xA5` and `0x3C` via TX.
- Waits for RX to receive both bytes and prints them.

### Sample Output
```
RX Data = a5
RX Data = 3c
```

---

## 🎓 Learning Objectives

- Understand asynchronous serial communication.
- Learn how FSMs can implement communication protocols.
- Explore baud rate timing and bit sampling.
- Simulate UART with loopback connection.

---

## 🚀 How to Run

1. Open all `.v` files in a simulator like ModelSim, Vivado, or Icarus Verilog.
2. Run `uart_full_tb.v` as the testbench.
3. Observe `tx` and `rx` lines in the waveform.
4. Use `$monitor` or GTKWave to view transmission progress.

---

## 📌 Notes

- Designed for simplicity, no parity or flow control.
- `tx_start` triggers one-byte transfer.
- `rx_done` goes high when one byte is received.

---

## 👨‍💻 Author

- **Name**: Adarsh Venugopal  
- **GitHub**: [https://github.com/AVM-27](https://github.com/AVM-27)  
- **Created On**: 2025-08-02

---
